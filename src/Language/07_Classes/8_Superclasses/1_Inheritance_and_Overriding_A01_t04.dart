/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class C inherits any instance members of its superclass that
 * are not overridden by members declared in C. A class may override instance members
 * that would otherwise have been inherited from its superclass.
 * @description Checks that static members don't conflict with static methods of a class.
 * @author msyabro
 * @reviewer iefremov
 */

class S {
  static var v;
  static int i;
  static method() {}
  static int iMethod() {}
}

class C extends S {
  static v() {}
  static i() {}
  static method() {}
  static iMethod() {}
}

main() {
  C.v();
  C.i();
  C.method();
  C.iMethod();
}
