/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let f be the function immediately enclosing a return statement of
 * the form return; It is a static warning f is neither a generator nor a
 * generative constructor and either:
 *  • f is synchronous and the return type of f may not be assigned to void or,
 *  • f is asynchronous and the return type of f may not be assigned to
 *    Future<Null>.
 *
 * @description Checks that a static warning occurs if a statement of the form
 * "return;" is used in an instance method whose declared return type may not be
 * assigned to void.
 *
 * @static-warning
 * @author rodionov
 * @reviewer iefremov
 */

class C {
  C() { }
  int foo() {
    if (true) {
      return 1;
    } else {
      return; /// static type warning
    }
  }
}

main() {
  new C().foo();
}
