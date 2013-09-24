/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise super.m is treated as a getter invocation
 * @description Checks that NoSuchMethodError is thrown if
 * superclass has no members named m.
 * @author ilya
 */
import "../../Utils/expect.dart";

class C {
}

class D extends C {
  D() {
    Expect.throws(() {
      super.qwe;
    }, (e) => e is NoSuchMethodError);
 }
}

main() {
  new D();
}

