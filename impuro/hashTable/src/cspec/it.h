/*
 * it.h
 *
 *      Author: Federico Scarpa
 */

#ifndef IT_H_
#define IT_H_

	#include "structures.h"
	#include "cspec.h"
	#include "describe.h"

	it_t* __it_create(const char*, void(*)(void));
	void __it_add_should(it_t* self, executable_t* executable);
	void __it_execute(it_t*);
	void __it_destroy(it_t*);

	#define it(description, block) {    												\
		void block;																		\
		it_t* it = __it_create(description, function);									\
		__describe_add_executable(describe, (executable_t*)it);							\
	}																					\

#endif /* IT_H_ */
