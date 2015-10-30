/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the mixin application declares support for interfaces, the
 * resulting class implements those interfaces.
 * @description Checks that if the mixin application declares support for
 * interfaces and the resulting class implements those interfaces then no
 * static warning occurs. Interface implementation declared partially in a
 * mixin, partially in a superclass
 * @static-clean
 * @author sgrekhov@unipro.ru
 */

abstract class I {
  num get g1;
  String get g2;
}

class S {
  num get g1 => 0;
}

class M {
  String get g2 => "M";
}

class C = S with M implements I;

main() {
  C c = new C();
  c.g1;
  c.g2;
}
