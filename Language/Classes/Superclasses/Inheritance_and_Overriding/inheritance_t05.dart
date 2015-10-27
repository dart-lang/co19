/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a class, let A be a superclass of C, and let S1...Sk
 * be superclasses of C that are also subclasses of A. C inherits all
 * accessible instance members of A that have not been overridden by a
 * declaration in C or in at least one of S1...Sk.
 * A class may override instance members that would otherwise have been
 * inherited from its superclass.
 * @description Checks that static members are not inherited.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */
import "../../../../Utils/expect.dart";

class S {
  static var v;
  static int i;
  static method() {}
  static int iMethod() { return 1; }
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
