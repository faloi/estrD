/*
 * structures.h
 *
 *      Author: Federico Scarpa
 */

#ifndef STRUCTURES_H_
#define STRUCTURES_H_

	#include "../utils/list/list.h"

	typedef struct {
		cspec_list_t* describes;
	} cspec_t;

	typedef struct executable {
		void(*execute)(struct executable*);
		void(*destroy)(struct executable*);
	} executable_t;

	typedef struct {
		void(*execute)(executable_t*);
		void(*destroy)(executable_t*);
		cspec_list_t* executables;
		void(*function)(void);
		const char* description;
	} describe_t;

	typedef struct {
		void(*execute)(executable_t*);
		void(*destroy)(executable_t*);
		cspec_list_t* shoulds;
		void(*function)(void);
		const char* description;
	} it_t;

#endif /* STRUCTURES_H_ */
