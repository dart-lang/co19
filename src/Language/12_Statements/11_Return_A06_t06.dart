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
 * @description Checks that there's no static warning when a statement of the form "return;" is
 * used in a method that returns type dynamic, or a constructor.
 * @author rodionov
 * @reviewer iefremov
 */

abstract class I {
  factory I() { return new C(); }
}

class C implements I {
  C() {return;}
  static sm() {return;}
  get g {return;}
  foo() { return;}
}

main() {
  var x = new C();
  x = C.sm();
  x = new C().foo();
  x = new C().g;
  x = new I();
}
