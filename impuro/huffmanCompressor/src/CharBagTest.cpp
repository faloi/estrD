/*
 * CharBagTest.cpp
 *
 *  Created on: Jun 18, 2014
 *      Author: faloi
 */

#include <cspec/cspec.h>
#include "CharBag.h"

int main(int argc, char **argv) {

    describe("CharBag", function () {
		describe("Calculo de ocurrencias", function() {
    		it("un char no almacenado tiene 0 ocurrencias", function() {
    			CharBag charBag = emptyCharBag(10);
    			should(get(charBag, 'a')) be equal(0);
    		});

    		it("un char almacenado una vez tiene 1 ocurrencia", function() {
    			CharBag charBag = emptyCharBag(10);

    			add(charBag, 'a');
    			should(get(charBag, 'a')) be equal(1);
    		});

    		it("un char almacenado N veces tiene N ocurrencias", function() {
    			CharBag charBag = emptyCharBag(10);

    			add(charBag, 'a');
    			add(charBag, 'a');
    			add(charBag, 'a');

    			should(get(charBag, 'a')) be equal(3);
    		});
    	});
    });

    return CSPEC_RESULT;

}


