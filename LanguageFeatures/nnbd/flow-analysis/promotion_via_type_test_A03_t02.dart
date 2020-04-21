/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a variable x is promotable via type test with type T
 * given variable model VM if
 *
 * VM = VariableModel(declared, promoted, tested, assigned, unassigned, captured)
 *  and captured is false
 *  and S is the current type of x in VM
 *  and not S <: T
 *  and T <: S or (S is X extends R and T <: R) or (S is X & R and T <: R)
 *
 * @description Checks that a variable is not promotable if T is not subtype of
 * S
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class R {}
class T {
  int foo() => 42;
}

test<X extends R>(X x) {
  if (x is T) {
    x.foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  R x = new R();
  test(x);
}
