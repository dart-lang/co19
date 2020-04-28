/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a variable x is promotable via assignment of an
 * expression of type T given variable model VM if
 *
 *  VM = VariableModel(declared, promoted, tested, assigned, unassigned,
 *  captured)
 *  and captured is false
 *  and S is the current type of x in VM
 *  and T <: S and not S <: T
 *  and T is a type of interest for x in tested
 *
 * @description Checks that a variable is promotable to the type T if all
 * requirements above are met.
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class S {}
class T extends S {
  int foo() => 42;
}

main() {
  S x = new S();
  if (x is T) {
    // nothing
  }
  x = new T();
  x.foo();
}
