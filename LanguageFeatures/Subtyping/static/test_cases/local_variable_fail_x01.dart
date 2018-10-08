/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the to local variable of type T1.
 * Assignment to local variable is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class LocalVariableTest {
  LocalVariableTest() {
    @T1 t1 = null;
    t1 = t0Instance; //# 03: compile-time error
  }

  LocalVariableTest.valid() {}

  test() {
    @T1 t1 = null;
    t1 = t0Instance; //# 04: compile-time error
  }

  static staticTest() {
    @T1 t1 = null;
    t1 = t0Instance; //# 05: compile-time error
  }
}

main() {
  @T1 t1 = null;
  t1 = t0Instance; //# 01: compile-time error

  bar () {
    @T1 t1 = null;
    t1 = t0Instance; //# 02: compile-time error
  }
  bar(); //# 02: compile-time error

  new LocalVariableTest(); //# 03: compile-time error
  new LocalVariableTest.valid().test(); //# 04: compile-time error
  LocalVariableTest.staticTest(); //# 05: compile-time error
}
