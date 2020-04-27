/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a variable x is promotable via initialization given
 * variable model VM if x is a local variable (not a formal parameter) and:
 *
 *  VM = VariableModel(declared, promoted, tested, assigned, unassigned,
 *    captured)
 *  and captured is false
 *  and promoted is empty
 *  and x is declared with no explicit type and no initializer
 *  and assigned is false and unassigned is true
 *
 * @description Checks that a variable is promotable to the type T if all
 * requirements above are met.
 *
 * @author sgrekhov@unipro.ru
 * @issue 41669
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class T {
  int foo() => 42;
}

main() {
  var x;
  x = new T();
  x.foo();
  x.bar(); // Check that x is not dynamic any longer
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
