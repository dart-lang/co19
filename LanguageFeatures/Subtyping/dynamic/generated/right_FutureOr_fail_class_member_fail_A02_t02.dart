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
 * @description Check that if a type T1 is Future<S1> and a type T0 is X0 and
 * X0 has bound S0 and S0 is not a subtype of Future<S1> or S1, then a type T0
 * is not a subtype of a type T1.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the superclass member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_FutureOr_fail_A02.dart and 
 * class_member_fail_x02.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';
// SharedOptions=--enable-experiment=non-nullable
import "dart:async";

class S1 {
  const S1();
}
class S0 {}
class X0 extends S0 {
}

X0 t0Instance = new X0();
FutureOr<S1> t1Instance = new Future.value(new S1());

const t1Default = const S1();




class ClassMemberSuper1_t02 {
  FutureOr<S1> m = t1Default;

  ClassMemberSuper1_t02(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.named(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.short(this.m);

  void set superSetter(FutureOr<S1> val) {}
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
    new ClassMember2_t02<FutureOr<S1>>();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<FutureOr<S1>>.short();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<FutureOr<S1>>.named();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<FutureOr<S1>>().m = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<FutureOr<S1>>().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<FutureOr<S1>>().test1();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t02<FutureOr<S1>>().test2();
  }, (e) => e is TypeError || e is CastError);
  //# -->
}
