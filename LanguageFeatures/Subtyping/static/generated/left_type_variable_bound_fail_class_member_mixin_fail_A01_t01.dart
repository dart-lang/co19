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
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the mixin member of type T1.
 * Assignment to instance variable of super class is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from left_type_variable_bound_fail_A01.dart and 
 * class_member_mixin_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



class T1 {}
class B0 {}
class X0 extends B0 {}

X0 t0Instance = new X0();
T1 t1Instance = new T1();




class ClassMemberSuper1_t03 {
  T1 m;
  void set superSetter(T1 val) {} //# 02: compile-time error
}

class ClassMember1_t03 extends Object with ClassMemberSuper1_t03 {
  test1() {
    m = t0Instance; //# 03: compile-time error
  }
  test2() {
    superSetter = t0Instance; //# 04: compile-time error
  }
}

main() {
  new ClassMember1_t03().m = t0Instance; //# 01: compile-time error
  new ClassMember1_t03().superSetter = t0Instance;  //# 02: compile-time error
  new ClassMember1_t03().test1();  //# 03: compile-time error
  new ClassMember1_t03().test2();  //# 04: compile-time error
}
