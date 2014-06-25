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

		it("el peso de un arbol es la suma de los pesos de sus subarboles", function(){
			HuffmanTree tree = binary(leaf('a', 7), leaf('b', 3));
			should(weight(tree)) be equal(10);
		});
	});

	return CSPEC_RESULT;
}


