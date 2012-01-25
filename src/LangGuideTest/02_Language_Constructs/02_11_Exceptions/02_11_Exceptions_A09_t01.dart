// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion If the finally has been reached through an exception, then the unwinding
 * of the stack continues if and only if the finally block finishes execution and is not
 * exited by other means (return, break, continue or throw).
 * @description Checks that the unwinding of the stack continues in conditions specified
 * by the assertion.
 * @author pagolubev
 * @reviewer iefremov
 */

class A {
  static bool caught;

  static foo() {
    try {
      throw 42;
    } finally {
      caught = true;
    }
  }
}

  
main() {
  A.caught = false;
  bool caught = false;

  try {
    A.foo();
  } catch(var e) {
    Expect.isTrue(A.caught);
    caught = true;
  }
  Expect.isTrue(caught);
}
