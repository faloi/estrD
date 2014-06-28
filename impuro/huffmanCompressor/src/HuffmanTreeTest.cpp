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
		static HuffmanTree tree;

		after(function() {
			deleteHuffmanTree(tree);
		});

		it("el peso de una hoja es su peso", function() {
			tree = leaf('z', 5);
			should_int(weight(tree)) be equal to(5);
		});

		it("el peso de un arbol es la suma de los pesos de sus subarboles", function(){
			tree = binary(leaf('a', 7), leaf('b', 3));
			should_int(weight(tree)) be equal to(10);
		});
	});

	return CSPEC_RESULT;
}


