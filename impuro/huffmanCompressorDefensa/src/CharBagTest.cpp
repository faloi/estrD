/*
 * CharBagTest.cpp
 *
 *  Created on: Jun 18, 2014
 *      Author: faloi
 */

#include <cspec/cspec.h>
#include "CharBag.h"

#define CHARBAG_SIZE 256

void charBagTest() {
  describe("CharBag", function () {

    static CharBag charBag;
    static CharBagIterator iterator;

    before(function(){
      charBag = emptyCharBag(CHARBAG_SIZE);
      iterator = iterate(charBag);
    });

    after(function(){
      deleteCharBag(charBag);
      deleteCharBagIterator(iterator);
    });

    describe("Calculo de ocurrencias", function() {
      it("un char no almacenado tiene 0 ocurrencias", function() {
        should_int(get(charBag, 'a')) be equal to(0);
      });

      it("un char almacenado una vez tiene 1 ocurrencia", function() {
        add(charBag, 'a');
        should_int(get(charBag, 'a')) be equal to(1);
      });

      it("un char almacenado N veces tiene N ocurrencias", function() {
        add(charBag, 'a');
        add(charBag, 'a');
        add(charBag, 'a');

        should_int(get(charBag, 'a')) be equal to(3);
      });

      it("remover un char sin ocurrencias no hace nada", function() {
        remove(charBag, 'a');

        should_int(get(charBag, 'a')) be equal to(0);
      });

      it("remover un char con mas de 1 ocurrencia decrementa su cantidad", function() {
    	  add(charBag, 'b');
		  add(charBag, 'b');

		  remove(charBag, 'b');

		  should_int(get(charBag, 'b')) be equal to(1);
      });
    });

    describe("Iterator", function() {
      it("un iterator recien creado sabe decir el current char", function() {
        add(charBag, 'a');
        should_char(currentChar(iterator)) be equal to('a');
      });

      it("un iterator recien creado sabe decir el count del current char", function() {
        add(charBag, 'a');
        add(charBag, 'a');

        should_int(currentCount(iterator)) be equal to(2);
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

        should_char(currentChar(iterator)) be equal to('b');
      });

      it("luego de remover un char con 1, se avanza al siguiente", function() {
    	  add(charBag, 'a');
		  add(charBag, 'b');

		  remove(charBag, 'a');

		  should_char(currentChar(iterator)) be equal to('b');
		  should_int(currentCount(iterator)) be equal to(1);
      });
    });
  });
}
