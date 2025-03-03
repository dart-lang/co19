// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
/// Named Function Types:
/// T0 is U0 Function<X0 extends B00, ..., Xk extends B0k>(V0 x0, ..., Vn xn,
///   {r0n+1 Vn+1 xn+1, ..., r0m Vm xm}) where r0j is empty or required for j in
///   n+1...m
/// and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ...,
///   Sn yn, {r1n+1 Sn+1 yn+1, ..., r1q Sq yq}) where r1j is empty or required
///   for j in n+1...q
/// and {yn+1, ... , yq} subsetof {xn+1, ... , xm}
/// and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...n
/// and Si[Z0/Y0, ..., Zk/Yk] <: Tj[Z0/X0, ..., Zk/Xk] for i in n+1...q, yj = xi
/// and for each j such that r0j is required, then there exists an i in n+1...q
///   such that xj = yi, and r1i is required
/// and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
/// and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
/// where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
///
/// @description Check that if `T0` has a required named argument and `T1` has
/// an optional named argument of the same type and with the same name, then
/// `T0` is not a subtype of `T1`.
/// @author sgrekhov22@gmail.com
/// @issue 52928
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be assigned to the superclass member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/named_function_types_fail_A61.dart and
/// test_cases/class_member_fail_x02.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

typedef void F0({required int i});
typedef void F1({int i});

void f0Instance({required int i}) {}
void f1Instance({int i = 0}) {}

F0 t0Instance = f0Instance;

const t1Default = f1Instance;

class ClassMemberSuper1_t02 {
  F1 m = t1Default;

  ClassMemberSuper1_t02(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.named(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.short(this.m);

  void set superSetter(F1 val) {}
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
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02.short();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02.named();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02().m = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02().test1();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02().test2();
  }, (e) => e is TypeError);

  // Test type parameters

  Expect.throws(() {
    new ClassMember2_t02<F1>();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<F1>.short();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<F1>.named();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<F1>().m = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<F1>().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<F1>().test1();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<F1>().test2();
  }, (e) => e is TypeError);
}
