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
      static CharBag charBag;

      describe("Calculo de ocurrencias", function() {

          before(function(){
            charBag = emptyCharBag(CHARBAG_SIZE);
          });

          it("un char no almacenado tiene 0 ocurrencias", function() {
            should_int(get(charBag, 'a')) be equal_to(0);
          });

          it("un char almacenado una vez tiene 1 ocurrencia", function() {
            add(charBag, 'a');
            should_int(get(charBag, 'a')) be equal_to(1);
          });

          it("un char almacenado N veces tiene N ocurrencias", function() {
            add(charBag, 'a');
            add(charBag, 'a');
            add(charBag, 'a');

            should_int(get(charBag, 'a')) be equal_to(3);
          });
        });

      describe("Iterator", function() {
        static CharBagIterator iterator;

          before(function(){
            charBag = emptyCharBag(CHARBAG_SIZE);
            iterator = iterate(charBag);
          });

        it("un iterator recien creado sabe decir el current char", function() {
          add(charBag, 'a');
          should_char(currentChar(iterator)) be equal_to('a');
        });

        it("un iterator recien creado sabe decir el count del current char", function() {
          add(charBag, 'a');
          add(charBag, 'a');

          should_int(currentCount(iterator)) be equal_to(2);
        });

        it("sabe decir si el elemento actual es valido", function() {
          add(charBag, 'a');
          should_bool(valid(iterator)) be truthy;
        });

        it("sabe decir si el elemento actual es invalido", function() {
          add(charBag, 'a');
          next(iterator);

          should_bool(valid(iterator)) be falsey;
        });

        it("puede avanzar al siguiente elemento", function() {
          add(charBag, 'a');
          add(charBag, 'b');
          add(charBag, 'b');

          next(iterator);

          should_char(currentChar(iterator)) be equal_to('b');
        });
      });
    });

    return CSPEC_RESULT;
}
