/*
 * cspec.h
 *
 *      Author: Federico Scarpa
 */

#ifndef CSPEC_H_
#define CSPEC_H_

	#include "structures.h"
	#include "describe.h"
	#include "it.h"

	void __cspec_create(void);
	void __cspec_destroy(void);
	void __cspec_add_describe(describe_t*);

	int __cspec_run(void);

	#define CSPEC_RESULT	__cspec_run();

#endif /* CSPEC_H_ */
