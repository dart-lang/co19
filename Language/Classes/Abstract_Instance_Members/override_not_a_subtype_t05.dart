/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply
 * to methods apply to abstract methods.
 * It is a compile error if an instance method m1 overrides an instance member
 * m2 and the type of m1 is not a subtype of the type of m2.
 * @description Checks that a compile error is produced when the return type of
 * an abstract method m1 is not assignable to the return type of non-abstract m2
 * (parameters of both methods being completely identical). Test type aliases
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A {
  int foo(var x) {}
}
typedef AAlias = A;

abstract class B extends AAlias {
  String foo(var x);
}
typedef BAlias = B;

class C extends BAlias {
  String foo(var x) {
  }
}

main() {
  new C().foo(2);
}

