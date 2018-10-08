/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Type Variable Bound: T0 is a type variable X0 with bound B0
 *   and B0 <: T1
 * @description Check that if T0 is a type variable X0 with bound B0 and
 * B0 is not a subtype of T1 then T0 is not a subtype of a type T1.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then instance
 * of T0 cannot be be used as a return value of type T1. Return value is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from left_type_variable_bound_fail_A01.dart and 
 * return_value_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



class T1 {}
class B0 {}
class X0 extends B0 {}

X0 t0Instance = new X0();
T1 t1Instance = new T1();




T1 returnValueFunc() => t0Instance; //# 01: compile-time error

class ReturnValueTest {
  static T1 staticTestMethod() => t0Instance; //# 03: compile-time error
  T1 testMethod() => t0Instance; //# 04: compile-time error
  T1 get testGetter => t0Instance; //# 05: compile-time error
}

main() {
  returnValueFunc(); //# 01: compile-time error

  T1 returnValueLocalFunc() => t0Instance; //# 02: compile-time error
  returnValueLocalFunc(); //# 02: compile-time error

  ReturnValueTest.staticTestMethod(); //# 03: compile-time error
  new ReturnValueTest().testMethod(); //# 04: compile-time error
  new ReturnValueTest().testGetter; //# 05: compile-time error
}
