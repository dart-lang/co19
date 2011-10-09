// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion If the finally has been reached through an exception, then the unwinding
 * of the stack continues if and only if the finally block finishes execution and is not
 * exited by other means (return, break, continue or throw).
 * @description Checks that exiting the finally block by throw aborts the unwinding of the stack.
 * @author pagolubev
 * @reviewer iefremov
 */

class A {
  static foo() {
    try {
      throw 42;
    } finally {
      throw "test";
    }
  }
}

  
void main() {
  try {
    A.foo();
  } catch (String e) {
    Expect.isTrue(e == "test");
  } catch(var e) {
    Expect.fail("Caught exception aborted by throw in finally clause.");
  }
}
