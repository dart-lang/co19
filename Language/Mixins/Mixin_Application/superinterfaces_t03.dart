/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a class declaration that includes MA in a with clause.
 * It is a static warning if C does not implement, directly or indirectly, all
 * the direct superinterfaces of M
 * @description Checks that it is no static warning if C does implement
 * directly all the direct superinterfaces of M
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

abstract class A {
  int get a;
}

abstract class B implements A {
  int get b;
}

abstract class M implements B {
}

class S {
}

class C extends S with M { /// static type warning
  int get a => 0;
  int get b => 0;
}

main() {
  new C();
}
