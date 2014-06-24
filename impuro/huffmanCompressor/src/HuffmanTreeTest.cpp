/*
 * HuffmanTreeTest.cpp
 *
 *  Created on: Jun 24, 2014
 *      Author: faloi
 */

#include <cspec/cspec.h>
#include "HuffmanTree.h"

int main() {
	describe("Huffman Tree", function() {
		it("el peso de una hoja es su peso", function() {
			HuffmanTree tree = leaf('z', 5);
			should(weight(tree)) be equal(5);
		});
	});

	return CSPEC_RESULT;
}


