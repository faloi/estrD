/*
 * cspec.c
 *
 *      Author: Federico Scarpa
 */

#include "cspec.h"
#include <stdlib.h>
#include <string.h>

static cspec_t* cspec = NULL;

void __cspec_create(void) {
	if (cspec == NULL) {
		cspec = malloc(sizeof(cspec));
		cspec->describes = cspec_list_create();
	}
}

void __cspec_destroy(void) {
	if (cspec != NULL) {
		cspec_list_destroy_and_destroy_elements(&cspec->describes, (void*)__describe_destroy);
		free(cspec);
	}
}

int __cspec_run(void) {
	if (cspec == NULL) return 0;
	cspec_list_do(cspec->describes, (void*)__describe_execute);
	__cspec_destroy();
	return 0;
}

void __cspec_add_describe(describe_t* describe) {
	if (cspec == NULL) __cspec_create();
	cspec_list_add_last(cspec->describes, describe);
}
