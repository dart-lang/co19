/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a class declaration that includes MA in a with clause.
 * It is a static warning if C does not implement, directly or indirectly, all
 * the direct superinterfaces of M
 * @description Checks that it is a compile error if M has a superinterfaces
 * and C does not implement them. Test class C = S with M; syntax
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
abstract class A {
  int get a;
}

abstract class B {
  int get b;
}

abstract class M implements A, B {
}

class S {
}

class C = S with M;

main() {
  new C();
}
