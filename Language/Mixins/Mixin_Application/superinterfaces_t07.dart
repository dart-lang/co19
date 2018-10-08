/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a class declaration that includes MA in a with clause.
 * It is a static warning if C does not implement, directly or indirectly, all
 * the direct superinterfaces of M
 * @description Checks that it is a compile error to derive a mixin from a
 * class which has a superclass other than Object, even if C does implement them
 * @issue 26409
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class A {
  int get a => 1;
}

class B extends A {
  int get b => 2;
}

class M extends B {
  int get c => 3;
}

class S extends A {
  int get a => -1;
}

class C extends S with M {
  int get b => -2;
}

main() {
  C c = new C();
  Expect.equals(-1, c.a);
  Expect.equals(-2, c.b);
}
