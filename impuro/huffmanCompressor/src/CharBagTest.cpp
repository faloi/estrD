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
			describe("un iterator recien creado", function() {
				it("sabe decir el current char", function() {
					CharBag charBag = emptyCharBag(CHARBAG_SIZE);
					add(charBag, 'a');

					CharBagIterator iterator = iterate(charBag);
					should(currentChar(iterator)) be equal('a');
				});

				it("sabe decir el count del current char", function() {
					CharBag charBag = emptyCharBag(CHARBAG_SIZE);
					add(charBag, 'a');
					add(charBag, 'a');

					CharBagIterator iterator = iterate(charBag);
					should(currentCount(iterator)) be equal(2);
				});
			});

			describe("valid", function() {
				it("sabe decir si el elemento actual es valido", function() {
					CharBag charBag = emptyCharBag(CHARBAG_SIZE);
					add(charBag, 'a');

					CharBagIterator iterator = iterate(charBag);
					should(valid(iterator)) be truthy;
				});

				it("sabe decir si el elemento actual es invalido", function() {
					CharBag charBag = emptyCharBag(CHARBAG_SIZE);
					add(charBag, 'a');

					CharBagIterator iterator = iterate(charBag);
					next(iterator);

					should(valid(iterator)) be falsey;
				});
			});

			describe("next", function() {
				it("puede avanzar al siguiente elemento", function() {
					CharBag charBag = emptyCharBag(CHARBAG_SIZE);
					add(charBag, 'a');
					add(charBag, 'b');
					add(charBag, 'b');

					CharBagIterator iterator = iterate(charBag);
					next(iterator);

					should(currentChar(iterator)) be equal('b');
				});
			});
		});
    });

    return CSPEC_RESULT;

}
