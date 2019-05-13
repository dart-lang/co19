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
 * static warning occurs. Test type aliases
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
abstract class I {
  num get g;
}

class A {
}

class M {
}

typedef IAlias = I;
typedef AAlias = A;
typedef MAlias = M;

abstract class B = AAlias with MAlias implements IAlias;

class C implements B {
  num get g => 0;
}

main() {
  C c = new C();
  c.g;
}
