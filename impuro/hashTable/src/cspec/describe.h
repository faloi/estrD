/*
 * describe.h
 *
 *      Author: Federico Scarpa
 */

#ifndef DESCRIBE_H_
#define DESCRIBE_H_

	#include "structures.h"
	#include "cspec.h"

	describe_t* __describe_create(const char*, void(*)(void));
	void __describe_add_executable(describe_t* self, executable_t* executable);
	void __describe_execute(describe_t*);
	void __describe_destroy(describe_t*);

	#define describe(description, block) {    											\
		describe_t* describe; 															\
		void block;																		\
		describe = __describe_create(description, function);							\
		__cspec_add_describe(describe);													\
	}																					\

#endif /* DESCRIBE_H_ */
