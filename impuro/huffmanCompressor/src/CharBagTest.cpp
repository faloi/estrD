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
    	describe("construccion y disposal", function() {
            it("se puede crear un charBag vacio", function () {
            	CharBag charBag = emptyCharBag(10);
            	should(charBag) not_be null;
            });
    	})
    });

    return CSPEC_RESULT;

}


