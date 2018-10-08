/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Interface Compositionality: T0 is an interface type
 * C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and each Si <: Ui
 * @description Check that if type T0 is an interface type
 * C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and not all of Si <: Ui then T0 is
 * not a subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the superclass member of type T1.
 * Assignment to variable of super class is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from interface_compositionality_fail_A01.dart and 
 * class_member_super_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



abstract class U0 {}
abstract class U1 {}
abstract class U2 {}

abstract class S0 extends U0 {}
abstract class S1 extends U1 {}
// no subtype relation between S2 and U2
abstract class S2 {}

class C0<X, Y, Z> {}

C0<S0, S1, S2> t0Instance = new C0<S0, S1, S2>();
C0<U0, U1, U2> t1Instance = new C0<U0, U1, U2>();




class ClassMemberSuper1_t02 {
  C0<U0, U1, U2> m;

  ClassMemberSuper1_t02(C0<S0, S1, S2> value) {
    m = value; //# 01: compile-time error
  }
  ClassMemberSuper1_t02.named(C0<S0, S1, S2> value) {
    m = value; //# 02: compile-time error
  }
  void set superSetter(C0<U0, U1, U2> val) {}
}

class ClassMember1_t02 extends ClassMemberSuper1_t02 {
  ClassMember1_t02() : super(t0Instance) {} //# 01: compile-time error
  ClassMember1_t02.named() : super.named(t0Instance) {} //# 02: compile-time error
  ClassMember1_t02.valid() : super(null);
  test1() {
    m = t0Instance; //# 05: compile-time error
  }
  test2() {
    superSetter = t0Instance; //# 06: compile-time error
  }
}

main() {
  new ClassMember1_t02(); //# 01: compile-time error
  new ClassMember1_t02.named(); //# 02: compile-time error
  new ClassMember1_t02.valid().m = t0Instance; //# 03: compile-time error
  new ClassMember1_t02.valid().superSetter = t0Instance; //# 04: compile-time error
  new ClassMember1_t02.valid().test1(); //# 05: compile-time error
  new ClassMember1_t02.valid().test2(); //# 06: compile-time error
}
