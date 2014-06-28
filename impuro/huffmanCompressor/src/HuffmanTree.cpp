/*
 * HuffmanTree.cpp
 *
 *  Created on: Jun 24, 2014
 *      Author: faloi
 */

#include <iostream>
#include "HuffmanTree.h"

#define NULL_CHARACTER '\0'

// INV. REP.
// weight - el peso del arbol de Huffman
// left y right - representan al arbol izquierdo y derecho respectivamente, las hojas se modelan con NULL en ambos subarboles

struct HuffmanTreeStr {
	char character;
	int weight;
	HuffmanTree left;
	HuffmanTree right;
};

// Private

inline HuffmanTree create(char c, int w, HuffmanTree a, HuffmanTree b) {
	HuffmanTree value = new HuffmanTreeStr;
	value->character = c;
	value->weight = w;
	value->left = a;
	value->right = b;

	return value;
}

void deleteSubtreeIfExists(HuffmanTree& t) {
	if (t != NULL)
		deleteHuffmanTree(t);
}

// Public

HuffmanTree leaf(char c, int w) {
	return create(c, w, NULL, NULL);
}

HuffmanTree binary(HuffmanTree a, HuffmanTree b) {
	return create(NULL_CHARACTER, weight(a) + weight(b), a, b);
}

inline int weight(HuffmanTree t) {
	return t->weight;
}

void deleteHuffmanTree(HuffmanTree& t) {
	deleteSubtreeIfExists(t->left);
	deleteSubtreeIfExists(t->right);

	delete t;
}

bool isLeaf(HuffmanTree t) {
	return t->character != NULL_CHARACTER;
}
