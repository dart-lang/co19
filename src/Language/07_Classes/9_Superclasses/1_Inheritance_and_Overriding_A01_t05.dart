/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class C inherits any accessible instance members of its superclass that
 * are not overridden by members declared in C. A class may override instance members
 * that would otherwise have been inherited from its superclass.
 * @see also 12.15.1 Ordinary Invocation: It is a static type warning if T does not have
 * an accessible (3.2) instance member named m.
 * @description Checks that static members are not inherited.
 * @static-warning
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
}

main() {
  var c = new C();
  Expect.throws(() => c.v, /// static type warning
   (e) => e is NoSuchMethodError);
  Expect.throws(() => c.i, /// static type warning
    (e) => e is NoSuchMethodError);
  Expect.throws(() => c.method(), /// static type warning
    (e) => e is NoSuchMethodError);
  Expect.throws(() => c.iMethod(), /// static type warning
    (e) => e is NoSuchMethodError);
}
