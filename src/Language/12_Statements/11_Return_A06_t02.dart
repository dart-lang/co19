/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let f be the function immediately enclosing a return statement of the form
 * return; It is a static warning if both of the following conditions hold:
 * - f is not a generative constructor.
 * - The return type of f may not be assigned to void.
 * @description Checks that a static warning occurs if a statement of the form "return;" is
 * used in a getter method whose declared return type is bool.
 * @static-warning
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

class C {
  C() { }  
  bool get foo {
    return; /// static type warning
  }
}

main() {
  bool x = new C().foo;
}
