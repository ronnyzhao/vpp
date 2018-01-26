#include <vlib/vlib.h>
#include <vnet/vnet.h>
#include <vnet/pg/pg.h>
#include <vnet/ethernet/ethernet.h>
#include <vnet/ethernet/packet.h>

#include <vlib/cli.h>

#include <vppinfra/error.h>
#include <vppinfra/hash.h>
#include <vppinfra/cache.h>

/** Add third part data-path. */
#include <vnet/teraspek/nb_desensitization.h>
#include <vnet/teraspek/nb_rc4.h>

#if 1
typedef struct {
  u32 next_index;
  u32 sw_if_index;
  u8 new_src_mac[6];
  u8 new_dst_mac[6];
} desensitization_trace_t;

static u8 *
format_mac_address (u8 * s, va_list * args)
{
  u8 *a = va_arg (*args, u8 *);
  return format (s, "%02x:%02x:%02x:%02x:%02x:%02x",
		 a[0], a[1], a[2], a[3], a[4], a[5]);
}

/* packet trace format function */
static u8 * format_desensitization_trace (u8 * s, va_list * args)
{
  CLIB_UNUSED (vlib_main_t * vm) = va_arg (*args, vlib_main_t *);
  CLIB_UNUSED (vlib_node_t * node) = va_arg (*args, vlib_node_t *);
  desensitization_trace_t * t = va_arg (*args, desensitization_trace_t *);
  
  s = format (s, "DESEN: sw_if_index %d, next index %d\n",
              t->sw_if_index, t->next_index);
  s = format (s, "  new src %U -> new dst %U",
              format_mac_address, t->new_src_mac, 
              format_mac_address, t->new_dst_mac);

  return s;
}

vlib_node_registration_t desensitization_node;

#define foreach_desensitization_error \
_(SWAPPED, "Mac swap packets processed")

typedef enum {
#define _(sym,str) DESEN_ERROR_##sym,
  foreach_desensitization_error
#undef _
  DESEN_N_ERROR,
} desensitization_error_t;

static char * desensitization_error_strings[] = {
#define _(sym,string) string,
  foreach_desensitization_error
#undef _
};

typedef enum {
  DESEN_NEXT_LOOPBACK,
  DESEN_N_NEXT,
} desensitization_next_t;

#define DESENSITIZATION_KEY	"IT'S a BUG"
#define DESENSITIZATION_SIZE	10
#define DESENSITIZATION_OFFSET	100
#define frame_size(bx)	(bx->current_length)

static inline void __encrypt (vlib_buffer_t * bx, unsigned char *packet, unsigned char * key0)
{
	if (frame_size(bx) > (DESENSITIZATION_SIZE + DESENSITIZATION_OFFSET)) {
		clib_warning ("encrypting ...");
	        rc4_crypt (key0,(unsigned char *)(packet + DESENSITIZATION_OFFSET),
	                  (unsigned long)DESENSITIZATION_SIZE);
	}
}

static uword
desensitization_node_fn (vlib_main_t * vm,
		  vlib_node_runtime_t * node,
		  vlib_frame_t * frame)
{
  u32 n_left_from, * from, * to_next;
  desensitization_next_t next_index;
  u32 pkts_swapped = 0;
  desensitization_main_t * dm = &desensitization_main;

  from = vlib_frame_vector_args (frame);
  n_left_from = frame->n_vectors;
  next_index = node->cached_next_index;
  
  while (n_left_from > 0)
    {
	clib_warning ("%d packets", n_left_from);

      u32 n_left_to_next;

      vlib_get_next_frame (vm, node, next_index,
			   to_next, n_left_to_next);

      while (n_left_from >= 4 && n_left_to_next >= 2)
	{
          u32 next0 = DESEN_NEXT_LOOPBACK;
          u32 next1 = DESEN_NEXT_LOOPBACK;
          u32 sw_if_index0, sw_if_index1;
          //u8 tmp0[6], tmp1[6];
          ethernet_header_t *en0, *en1;
          u32 bi0, bi1;
	  vlib_buffer_t * b0, * b1;
          
	  /* Prefetch next iteration. */
	  {
	    vlib_buffer_t * p2, * p3;
            
	    p2 = vlib_get_buffer (vm, from[2]);
	    p3 = vlib_get_buffer (vm, from[3]);
            
	    vlib_prefetch_buffer_header (p2, LOAD);
	    vlib_prefetch_buffer_header (p3, LOAD);

	    CLIB_PREFETCH (p2->data, CLIB_CACHE_LINE_BYTES, STORE);
	    CLIB_PREFETCH (p3->data, CLIB_CACHE_LINE_BYTES, STORE);
	  }

          /* speculatively enqueue b0 and b1 to the current next frame */
	  to_next[0] = bi0 = from[0];
	  to_next[1] = bi1 = from[1];
	  from += 2;
	  to_next += 2;
	  n_left_from -= 2;
	  n_left_to_next -= 2;

	  b0 = vlib_get_buffer (vm, bi0);
	  b1 = vlib_get_buffer (vm, bi1);

          ASSERT (b0->current_data == 0);
          ASSERT (b1->current_data == 0);
	
          en0 = vlib_buffer_get_current (b0);
          en1 = vlib_buffer_get_current (b1);

          sw_if_index0 = vnet_buffer(b0)->sw_if_index[VLIB_RX];
          sw_if_index1 = vnet_buffer(b1)->sw_if_index[VLIB_RX];

	if (PREDICT_FALSE(dm->d_type == NB_D_TYPE_ENCRYPT)) {
  		__encrypt (b0, (unsigned char *)b0->data, dm->d_key0);
  		__encrypt (b1, (unsigned char *)b1->data, dm->d_key0);
	}else {	/** here can be real code. */
  		__encrypt (b0, (unsigned char *)b0->data, dm->d_key0);
  		__encrypt (b1, (unsigned char *)b1->data, dm->d_key0);
	}

          pkts_swapped += 2;

          if (PREDICT_FALSE((node->flags & VLIB_NODE_FLAG_TRACE)))
            {
              if (b0->flags & VLIB_BUFFER_IS_TRACED) 
                {
                    desensitization_trace_t *t = 
                      vlib_add_trace (vm, node, b0, sizeof (*t));
                    t->sw_if_index = sw_if_index0;
                    t->next_index = next0;
                    clib_memcpy (t->new_src_mac, en0->src_address,
                                 sizeof (t->new_src_mac));
                    clib_memcpy (t->new_dst_mac, en0->dst_address,
                                 sizeof (t->new_dst_mac));
                    
                  }
                if (b1->flags & VLIB_BUFFER_IS_TRACED) 
                  {
                    desensitization_trace_t *t = 
                      vlib_add_trace (vm, node, b1, sizeof (*t));
                    t->sw_if_index = sw_if_index1;
                    t->next_index = next1;
                    clib_memcpy (t->new_src_mac, en1->src_address,
                                 sizeof (t->new_src_mac));
                    clib_memcpy (t->new_dst_mac, en1->dst_address,
                                 sizeof (t->new_dst_mac));
                  }
              }
            
            /* verify speculative enqueues, maybe switch current next frame */
            vlib_validate_buffer_enqueue_x2 (vm, node, next_index,
                                             to_next, n_left_to_next,
                                             bi0, bi1, next0, next1);
        }

      while (n_left_from > 0 && n_left_to_next > 0)
	{
          u32 bi0;
	  vlib_buffer_t * b0;
          u32 next0 = DESEN_NEXT_LOOPBACK;
          u32 sw_if_index0;
          //u8 tmp0[6];
          ethernet_header_t *en0;

          /* speculatively enqueue b0 to the current next frame */
	  bi0 = from[0];
	  to_next[0] = bi0;
	  from += 1;
	  to_next += 1;
	  n_left_from -= 1;
	  n_left_to_next -= 1;

	  b0 = vlib_get_buffer (vm, bi0);
          /* 
           * Direct from the driver, we should be at offset 0
           * aka at &b0->data[0]
           */
          ASSERT (b0->current_data == 0);
			
          en0 = vlib_buffer_get_current (b0);

          sw_if_index0 = vnet_buffer(b0)->sw_if_index[VLIB_RX];

	/** Encrypt is default. */
	if (PREDICT_FALSE(dm->d_type == NB_D_TYPE_ENCRYPT)) {
  		__encrypt (b0, (unsigned char *)b0->data, dm->d_key0);
	}else {	/** here can be real code. */
  		__encrypt (b0, (unsigned char *)b0->data, dm->d_key0);
	}

          if (PREDICT_FALSE((node->flags & VLIB_NODE_FLAG_TRACE) 
                            && (b0->flags & VLIB_BUFFER_IS_TRACED))) {
            desensitization_trace_t *t = 
               vlib_add_trace (vm, node, b0, sizeof (*t));
            t->sw_if_index = sw_if_index0;
            t->next_index = next0;
            clib_memcpy (t->new_src_mac, en0->src_address,
                         sizeof (t->new_src_mac));
            clib_memcpy (t->new_dst_mac, en0->dst_address,
                         sizeof (t->new_dst_mac));
            }
            
          pkts_swapped += 1;

          /* verify speculative enqueue, maybe switch current next frame */
	  vlib_validate_buffer_enqueue_x1 (vm, node, next_index,
					   to_next, n_left_to_next,
					   bi0, next0);
	}

      vlib_put_next_frame (vm, node, next_index, n_left_to_next);

    }

  vlib_node_increment_counter (vm, desensitization_node.index, 
                               DESEN_ERROR_SWAPPED, pkts_swapped);
  return frame->n_vectors;
}

VLIB_REGISTER_NODE (desensitization_node) = {
  .function = desensitization_node_fn,
  .name = "desensitization-input",
  .vector_size = sizeof (u32),
  .format_trace = format_desensitization_trace,
  .type = VLIB_NODE_TYPE_INTERNAL,
  
  .n_errors = ARRAY_LEN(desensitization_error_strings),
  .error_strings = desensitization_error_strings,

  .n_next_nodes = DESEN_N_NEXT,

  /* edit / add dispositions here */
  .next_nodes = {
        [DESEN_NEXT_LOOPBACK] = "loopback-input",
  },
};

/* Action function shared between message handler and debug CLI */
int desensitization_enable_disable (desensitization_main_t * dm, u32 sw_if_index,
                                   int enable_disable)
{
  vnet_sw_interface_t * sw;
  int rv = 0;

  /* Utterly wrong? */
  if (pool_is_free_index (dm->vnet_main->interface_main.sw_interfaces, 
                          sw_if_index))
    return VNET_API_ERROR_INVALID_SW_IF_INDEX;

  /* Not a physical port? */
  sw = vnet_get_sw_interface (dm->vnet_main, sw_if_index);
  if (sw->type != VNET_SW_INTERFACE_TYPE_HARDWARE)
    return VNET_API_ERROR_INVALID_SW_IF_INDEX;
  
  vnet_feature_enable_disable ("device-input", "desensitization-input",
                               sw_if_index, enable_disable, 0, 0);

  return rv;
}

static clib_error_t *
desensitization_enable_disable_command_fn (vlib_main_t * vm,
                                   unformat_input_t * input,
                                   vlib_cli_command_t * cmd)
{
  desensitization_main_t * dm = &desensitization_main;
  u32 sw_if_index = ~0;
  int enable_disable = 1;
    
  int rv;

  while (unformat_check_input (input) != UNFORMAT_END_OF_INPUT) {
    if (unformat (input, "disable"))
      enable_disable = 0;
    else if (unformat (input, "%U", unformat_vnet_sw_interface,
                       dm->vnet_main, &sw_if_index))
      ;
    else
      break;
  }

  if (sw_if_index == ~0)
    return clib_error_return (0, "Please specify an interface...");
    
  rv = desensitization_enable_disable (dm, sw_if_index, enable_disable);

  switch(rv) {
  case 0:
  	dm->d_enabled = enable_disable;
    return clib_error_return (0, "%U success",
				format_vnet_sw_if_index_name, vnet_get_main(),
				sw_if_index);
    break;

  case VNET_API_ERROR_INVALID_SW_IF_INDEX:
    return clib_error_return 
      (0, "Invalid interface, only works on physical ports");
    break;

  case VNET_API_ERROR_UNIMPLEMENTED:
    return clib_error_return (0, "Device driver doesn't support redirection");
    break;

  default:
    return clib_error_return (0, "Unknown %d",
                              rv);
  }
  return 0;
}

VLIB_CLI_COMMAND (desensitization_enable_disable_cmd, static) = {
    .path = "set desensitization",
    .short_help = 
    "set desensitization <interface-name> [disable]",
    .function = desensitization_enable_disable_command_fn,
};

#if 0
static clib_error_t * desensitization_init (vlib_main_t * vm)
{
  desensitization_main_t * dm = &desensitization_main;
  clib_error_t * error = 0;

  dm->vlib_main = vm;
  dm->vnet_main = vnet_get_main ();
  dm->name = format (0, "desensitization_%08x%c", 0x2, 0);
  clib_warning ("------------------ %s", dm->name);

  dm->d_type = NB_D_TYPE_ENCRYPT;
  dm->d_key = format (0, "%s", DESENSITIZATION_KEY);
  dm->d_key_size = strlen (DESENSITIZATION_KEY);
  
  rc4_init((u8*)&dm->d_key0[0], dm->d_key, (unsigned long)dm->d_key_size);
  clib_warning ("key=%s", dm->d_key);
  clib_warning ("key0=%s", dm->d_key0);
  
  return error;
}

VLIB_INIT_FUNCTION (desensitization_init);

VNET_FEATURE_INIT (frame_desensitization, static) = {
  .arc_name = "device-input",
  .node_name = "desensitization-input",
  .runs_before = VNET_FEATURES ("loopback-input"),
};
#endif
#endif

