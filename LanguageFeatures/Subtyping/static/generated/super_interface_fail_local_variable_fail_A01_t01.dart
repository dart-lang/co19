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
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the to local variable of type T1.
 * Assignment to local variable is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from super_interface_fail_A01.dart and 
 * local_variable_fail_x01.dart.
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




class LocalVariableTest {
  LocalVariableTest() {
    T1 t1 = null;
    t1 = t0Instance; //# 03: compile-time error
  }

  LocalVariableTest.valid() {}

  test() {
    T1 t1 = null;
    t1 = t0Instance; //# 04: compile-time error
  }

  static staticTest() {
    T1 t1 = null;
    t1 = t0Instance; //# 05: compile-time error
  }
}

main() {
  T1 t1 = null;
  t1 = t0Instance; //# 01: compile-time error

  bar () {
    T1 t1 = null;
    t1 = t0Instance; //# 02: compile-time error
  }
  bar(); //# 02: compile-time error

  new LocalVariableTest(); //# 03: compile-time error
  new LocalVariableTest.valid().test(); //# 04: compile-time error
  LocalVariableTest.staticTest(); //# 05: compile-time error
}
