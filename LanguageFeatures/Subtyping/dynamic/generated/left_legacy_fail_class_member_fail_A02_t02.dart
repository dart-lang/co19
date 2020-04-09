/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Legacy if T0 is S0* then:
 * - T0 <: T1 iff S0 <: T1.
 * @description Check that if type T0 is S0* and S0 <: T1 then T0 is subtype of
 * T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the superclass member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_legacy_fail_A02.dart and 
 * class_member_fail_x02.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../utils/legacy_lib.dart";

class A extends X {
  const A();
}

X t0Instance = new X();
A t1Instance = new A();

const t1Default = const A();




class ClassMemberSuper1_t02 {
  A m = t1Default;

  ClassMemberSuper1_t02(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.named(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.short(this.m);

  void set superSetter(A val) {}
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
    new ClassMember2_t02<A>();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<A>.short();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<A>.named();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<A>().m = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<A>().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<A>().test1();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<A>().test2();
  }, (e) => e is TypeError || e is CastError);
  //# -->
}
