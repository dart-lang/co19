/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The on word is not reserved in any way, it is a context-specific
 * keyword that has a specific meaning when occuring after the type name of a
 * mixin declaration.
 *
 * @description Checks that the on word is not reserved word in any way, it is
 * a context-specific keyword that has a specific meaning when occurs after the
 * type name of a mixin declaration.
 * @author ngl@unipro.ru
 */

class A {
  A() {}
  A.on() {}
}

class B {
  int i = 2;
  set on(int p) => i = p;
  int get on => i;
}

class C {
  int i = 3;
  int on() => i;
}

class on {}

main() {
  new A();
  new A.on();
  new B();
  new C();
  new on();
}
