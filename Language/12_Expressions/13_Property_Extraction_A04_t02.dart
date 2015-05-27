/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise super.m is treated as a getter invocation
 * @description Checks that NoSuchMethodError is thrown if
 * superclass has an implicit or explicit static getter named m.
 * @static-warning
 * @author ilya
 */
import "../../Utils/expect.dart";

class C {
  static var implicit = 1;
  static get explicit => 2;
}

class D extends C {
  D() {
    Expect.throws(() {
      super.implicit; // static warning
    }, (e) => e is NoSuchMethodError);

    Expect.throws(() {
      super.explicit; // static warning
    }, (e) => e is NoSuchMethodError);
  }
}

main() {
  new D();
}

