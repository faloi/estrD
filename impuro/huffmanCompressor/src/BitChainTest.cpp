/*
 * BitChainTest.cpp
 *
 *  Created on: Jun 28, 2014
 *      Author: faloi
 */

#include "ZipTable.h"
#include <cspec/cspec.h>
#include <iostream>
using namespace std;

void bitChainTest() {
	describe("BitChain", function() {
		it("toString", function() {
			BitChain bitChain = emptyBitChain();
			append(bitChain, true);
			append(bitChain, false);
			append(bitChain, false);

			should_char(toString(bitChain)) be equal to("100");
		});
	});
}
