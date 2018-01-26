#ifndef __NB_DESEN_H__
#define __NB_DESEN_H__


typedef struct {
    /* convenience */
    vlib_main_t * vlib_main;
    vnet_main_t * vnet_main;
    u8 *name;

	/** Y or N, disabled defaultly. */
	u32 d_enabled;

#define NB_D_TYPE_ENCRYPT	(1)
#define NB_D_TYPE_TAMPER	(2)
	/** RC4 or Memset */
	u32 d_type;
	u8 *d_key;
	u8 d_key0[256];
	u8 d_key_size;

	
} desensitization_main_t;

desensitization_main_t desensitization_main;

vlib_node_registration_t desensitization_node;


#endif
