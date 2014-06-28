/*
 * PriorityQueueTest.cpp
 *
 *  Created on: Jun 28, 2014
 *      Author: faloi
 */

#include <cspec/cspec.h>
#include "PriorityQueue.h"

void priorityQueueTest() {
	describe("PriorityQueue", function() {
		static PriorityQueue queue;

		before(function(){
			queue = emptyPriorityQueue();
		});

		it("una queue vacia tiene size 0", function() {
			should_int(size(queue)) be equal to(0);
		});
	});
}
