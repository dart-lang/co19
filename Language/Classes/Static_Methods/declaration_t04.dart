/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static methods are functions, other than getters or setters,
 * whose declarations are immediately contained within a class declaration
 * and that are declared static.
 * The static methods of a class C are those static methods declared by C.
 * @description Checks that static methods can access static members of the
 * class they're declared in using both fully qualified and shortened syntax.
 * Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../../Utils/expect.dart";

class C {
  static final int stVar1 = 0, stVar2 = 1;

  static int foo() {
    return stVar1 + CAlias.stVar2;
  }
}

typedef CAlias = C;

main() {
  Expect.equals(1, C.foo());
}
