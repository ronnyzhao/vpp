#ifndef __NB_LOOPBACK_H__
#define __NB_LOOPBACK_H__

typedef struct {
    /* convenience */
    vlib_main_t * vlib_main;
    vnet_main_t * vnet_main;
    ethernet_main_t * ethernet_main;
	u8 *name;
} loopback_main_t;

loopback_main_t loopback_main;

vlib_node_registration_t loopback_node;



#endif

