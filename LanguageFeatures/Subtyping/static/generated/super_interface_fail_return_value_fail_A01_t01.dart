/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Super-Interface: T0 is an interface type with super-interfaces S0,...Sn
 * - and Si <: T1 for some i
 * @description Check that if there is no i, such that Si <: T1, then T0 is not
 * subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then instance
 * of T0 cannot be be used as a return value of type T1. Return value is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from super_interface_fail_A01.dart and 
 * return_value_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



class T1 {}

// Missing subtype relation to T1
abstract class S0 {}
abstract class S1 {}
abstract class S2 {}

abstract class T0 implements S0, S1, S2  {}

class T implements T0 {}

T0 t0Instance = new T();
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
