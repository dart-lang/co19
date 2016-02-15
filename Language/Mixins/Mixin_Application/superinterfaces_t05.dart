/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a class declaration that includes MA in a with clause.
 * It is a static warning if C does not implement, directly or indirectly, all
 * the direct superinterfaces of M
 * @description Checks that it is no static warning if M directly implements all
 * its superinterfaces
 * @static-clean
 * @author sgrekhov@unipro.ru
 */

class A {
  int get a => 0;
}

abstract class B implements A {
  int get b;
}

class M implements B {
  int get a => -1;
  int get b => 1;
}

class S {
}

class C extends S with M { /// static type warning
}

main() {
  new C();
}
