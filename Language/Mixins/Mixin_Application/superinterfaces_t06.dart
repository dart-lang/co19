/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a class declaration that includes MA in a with clause.
 * It is a static warning if C does not implement, directly or indirectly, all
 * the direct superinterfaces of M
 * @description Checks that it is a static warning if M has implicit
 * superinterfaces and C does not implement them
 * @static-warning
 * @author sgrekhov@unipro.ru
 */

class A {
  int get a => 0;
}

class B extends A {
  int get b => 1;
}

class M extends B {
  int get c => -1;
}

class S {
}

class C extends S with M { /// static type warning, C does not implement b and a
}

main() {
  new C();
}
