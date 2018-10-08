/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right FutureOr: T1 is FutureOr<S1> and
 *   either T0 <: Future<S1>
 *   or T0 <: S1
 *   or T0 is X0 and X0 has bound S0 and S0 <: T1
 *   or T0 is X0 & S0 and S0 <: T1
 * @description Check that if a type T1 is FutureOr<S1> and a type T0 is not
 * a subtype of types Future<S1> or S1, then a type T0 is not a subtype of a
 * type T1.
 * @author ngl@unipro.ru
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
 * This test is generated from right_FutureOr_fail_A01.dart and 
 * class_member_super_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



import "dart:async";

class S1 {}
class T0 {}

T0 t0Instance = new T0();
FutureOr<S1> t1Instance = new Future.value(new S1());




class ClassMemberSuper1_t02 {
  FutureOr<S1> m;

  ClassMemberSuper1_t02(T0 value) {
    m = value; //# 01: compile-time error
  }
  ClassMemberSuper1_t02.named(T0 value) {
    m = value; //# 02: compile-time error
  }
  void set superSetter(FutureOr<S1> val) {}
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
