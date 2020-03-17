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
 * instance of T0 cannot be be assigned to the superclass member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from interface_compositionality_fail_A01.dart and 
 * class_member_fail_x02.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';
// SharedOptions=--enable-experiment=non-nullable
abstract class U0 {}
abstract class U1 {}
abstract class U2 {}

abstract class S0 extends U0 {}
abstract class S1 extends U1 {}
// no subtype relation between S2 and U2
abstract class S2 {}

class C0<X, Y, Z> {
  const C0();
}

C0<S0, S1, S2> t0Instance = new C0<S0, S1, S2>();
C0<U0, U1, U2> t1Instance = new C0<U0, U1, U2>();

const t1Default = const C0<U0, U1, U2>();




class ClassMemberSuper1_t02 {
  C0<U0, U1, U2> m = t1Default;

  ClassMemberSuper1_t02(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.named(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.short(this.m);

  void set superSetter(C0<U0, U1, U2> val) {}
}

class ClassMember1_t02 extends ClassMemberSuper1_t02 {

  ClassMember1_t02() : super(forgetType(t0Instance)) {}

  ClassMember1_t02.named() : super.named(forgetType(t0Instance)) {}

  ClassMember1_t02.short() : super.short(forgetType(t0Instance));

  ClassMember1_t02.valid() : super(null);

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

class ClassMemberSuper2_t02<X> {
  X m;

  ClassMemberSuper2_t02(X value): m = value {
  }

  ClassMemberSuper2_t02.named(X value): m = value {
  }

  ClassMemberSuper2_t02.short(this.m);

  void set superSetter(X val) {}
}

class ClassMember2_t02<X> extends ClassMemberSuper2_t02<X> {

  ClassMember2_t02() : super(forgetType(t0Instance)) {}

  ClassMember2_t02.named() : super.named(forgetType(t0Instance)) {}

  ClassMember2_t02.short() : super.short(forgetType(t0Instance));

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

main() {
  Expect.throws(() {
    new ClassMember1_t02();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember1_t02.short();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember1_t02.named();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember1_t02().m = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember1_t02().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember1_t02().test1();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember1_t02().test2();
  }, (e) => e is TypeError || e is CastError);

  // Test type parameters

  //# <-- NotGenericFunctionType
  Expect.throws(() {
    new ClassMember2_t02<C0<U0, U1, U2>>();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<C0<U0, U1, U2>>.short();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<C0<U0, U1, U2>>.named();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<C0<U0, U1, U2>>().m = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<C0<U0, U1, U2>>().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<C0<U0, U1, U2>>().test1();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<C0<U0, U1, U2>>().test2();
  }, (e) => e is TypeError || e is CastError);
  //# -->
}
