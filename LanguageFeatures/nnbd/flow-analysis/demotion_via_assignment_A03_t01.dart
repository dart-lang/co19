/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a variable x is demotable via assignment of an
 * expression of type T given variable model VM if
 *
 *  VM = VariableModel(declared, promoted, tested, assigned, unassigned,
 *  captured)
 *  and captured is false
 *  and declared::promoted contains a type S such that T is S or T is NonNull(S)
 *
 * @description Checks that if captured is true then no promotion/demotion is
 * performed
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class A {}
class B extends A {
  int bar() => 42;
}
class T extends B {
  int foo() => 42;
}

Function? f;
main() {
  A x = new T();
  if (x is B) {
    if (x is T) {
      x.foo();
      void func(var v) {
        x = v;
      }
      f = func;
      x = new B();
      x.bar();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}
