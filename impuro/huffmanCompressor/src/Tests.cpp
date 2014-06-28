/*
 * Tests.cpp
 *
 *  Created on: Jun 28, 2014
 *      Author: faloi
 */

#include <cspec/cspec.h>
#include "Tests.h"

int main() {
	charBagTest();
	huffmanTreeTest();
	priorityQueueTest();

	return CSPEC_RESULT;
}
