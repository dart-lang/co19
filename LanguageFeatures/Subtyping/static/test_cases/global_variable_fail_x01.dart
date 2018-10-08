/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the to global variable of type T1.
 * Assignment to global variable is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class GlobalVariableTest {
  GlobalVariableTest() {
    t1Instance = t0Instance; //# 03: compile-time error
  }
  GlobalVariableTest.valid() {}

  foo() {
    t1Instance = t0Instance; //# 04: compile-time error
  }
  static test() {
    t1Instance = t0Instance; //# 05: compile-time error
  }
}

main() {
  t1Instance = t0Instance; //# 01: compile-time error

  bar () {
    t1Instance = t0Instance; //# 02: compile-time error
  }
  bar(); //# 02: compile-time error

  new GlobalVariableTest(); //# 03: compile-time error
  new GlobalVariableTest.valid().foo(); //# 04: compile-time error
  GlobalVariableTest.test(); //# 05: compile-time error
}
