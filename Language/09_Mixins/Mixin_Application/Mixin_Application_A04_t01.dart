/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the mixin application declares support for interfaces, the resulting class
 * implements those interfaces.
 * @description Checks that If the mixin application declares support for interfaces,
 * the resulting class implements those interfaces and no static warning occurs
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

abstract class I {
  num get g;
}

class A {
}

class M1 {
  num v2 = 0;
}

abstract class C = A with M1 implements I;

main() {
  C c = null;
  Expect.throws(() {var x = c.g;}, (e) => e is NoSuchMethodError);
}
