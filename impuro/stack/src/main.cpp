#include "stack.h"
#include <cspec/cspec.h>

int main()
{
	describe("size", function() {
		it("should be 0 for an empty stack", function() {
		    Stack s = emptyStack();
		    should_be_equals(0, size(s));
		});

		it("should be the count for a non empty stack", function() {
		    Stack s = emptyStack();
		    push(s, 25);

		    should_be_equals(2, size(s));
		});
	});

    return CSPEC_RESULT;
}
