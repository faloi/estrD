/*
 * CharBagTest.cpp
 *
 *  Created on: Jun 18, 2014
 *      Author: faloi
 */

#include <cspec/cspec.h>
#include "CharBag.h"

#define CHARBAG_SIZE 256

int main(int argc, char **argv) {

    describe("CharBag", function () {
		describe("Calculo de ocurrencias", function() {
    		it("un char no almacenado tiene 0 ocurrencias", function() {
    			CharBag charBag = emptyCharBag(CHARBAG_SIZE);
    			should(get(charBag, 'a')) be equal(0);
    		});

    		it("un char almacenado una vez tiene 1 ocurrencia", function() {
    			CharBag charBag = emptyCharBag(CHARBAG_SIZE);

    			add(charBag, 'a');
    			should(get(charBag, 'a')) be equal(1);
    		});

    		it("un char almacenado N veces tiene N ocurrencias", function() {
    			CharBag charBag = emptyCharBag(CHARBAG_SIZE);

    			add(charBag, 'a');
    			add(charBag, 'a');
    			add(charBag, 'a');

    			should(get(charBag, 'a')) be equal(3);
    		});
    	});

		describe("Iterator", function() {
			it("un iterator recien creado apunta al primer elemento", function() {
				CharBag charBag = emptyCharBag(CHARBAG_SIZE);
				add(charBag, 'a');

				CharBagIterator iterator = iterate(charBag);
				should(currentChar(iterator)) be equal('a');
			});
		});
    });

    return CSPEC_RESULT;

}


