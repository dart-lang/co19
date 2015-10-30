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
 * static warning occurs. Interface implementation declared in mixin
 * @static-clean
 * @author sgrekhov@unipro.ru
 */

abstract class I {
  num get g;
}

class S {
}

class M {
  num get g => 0;
}

class C = S with M implements I;

main() {
  C c = new C();
  c.g;
}
