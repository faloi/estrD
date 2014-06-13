/*
 * describe.c
 *
 *      Author: Federico Scarpa
 */

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "describe.h"

describe_t* __describe_create(const char* description, void(*function)(void)) {
	describe_t* self = malloc(sizeof(describe_t));
	self->execute = (void*)__describe_execute;
	self->destroy = (void*)__describe_destroy;
	self->executables = cspec_list_create();
	self->function = function;
	self->description = description;
	return self;
}

void __describe_execute(describe_t* self) {
	puts(self->description);
	self->function();
	void execute(executable_t* executable) { executable->execute(executable); }
	cspec_list_do(self->executables, (void*)execute);
}

void __describe_add_executable(describe_t* self, executable_t* executable) {
	cspec_list_add_last(self->executables, executable);
}

void __describe_destroy(describe_t* self) {
	void destroy(executable_t* executable) { executable->destroy(executable); }
	cspec_list_destroy_and_destroy_elements(&self->executables, (void*)destroy);
	free(self);
}

