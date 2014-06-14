/*
 * it.c
 *
 *      Author: Federico Scarpa
 */

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "it.h"

it_t* __it_create(const char* description, void(*function)(void)) {
	it_t* self = malloc(sizeof(it_t));
	self->execute = (void*)__it_execute;
	self->destroy = (void*)__it_destroy;
	self->shoulds = cspec_list_create();
	self->function = function;
	self->description = description;
	return self;
}

void __it_execute(it_t* self) {
	puts(self->description);
	self->function();
//	cspec_list_do(self->shoulds, (void*)__it_execute);
}

void __it_add_should(it_t* self, executable_t* executable) {
	cspec_list_add_last(self->shoulds, executable);
}

void __it_destroy(it_t* self) {
//	cspec_list_destroy_and_destroy_elements(&self->shoulds, (void*)destroy);
	free(self);
}

