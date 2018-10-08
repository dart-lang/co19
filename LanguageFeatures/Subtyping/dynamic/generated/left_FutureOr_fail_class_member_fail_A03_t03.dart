/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left FutureOr: T0 is FutureOr<S0>
 *   and Future<S0> <: T1
 *   and S0 <: T1
 * @description Check that if a type T0 is FutureOr<S0> and S0 is a subtype of
 * T1 but Future<S0> is not a subtype of T1, then a type T0 is not a subtype of
 * a type T1. Case when an instance of T0 is an instance of Future<S0> type.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the mixin member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_FutureOr_fail_A03.dart and 
 * class_member_fail_x03.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

import "dart:async";

class C1 {}
class S0 implements Future<C1> {
  asStream() => null;
  catchError(Function onError, {bool test(Object error)}) => null;
  then<S0>(FutureOr<S0> onValue(C1 value), {Function onError}) => null;
  timeout(Duration timeLimit, {FutureOr<C1> onTimeout()}) => null;
  whenComplete(FutureOr action()) => null;
}

// Future<S0> is not a subtype of T1 (Future<C1>)
FutureOr<S0> t0Instance = new Future<S0>.value(new S0());
Future<C1> t1Instance = new Future.value(new C1());




class ClassMemberSuper1_t03 {
  Future<C1> m;

  void set superSetter(Future<C1> val) {}
}

class ClassMember1_t03 extends Object with ClassMemberSuper1_t03 {

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

class ClassMemberSuper2_t03<X> {
  X m;

  void set superSetter(X val) {}
}

class ClassMember2_t03<X> extends ClassMemberSuper2_t03<X> {

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

main() {
  Expect.throws(() {
    new ClassMember1_t03().m = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t03().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t03().test1();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t03().test2();
  }, (e) => e is TypeError);

  // Test type parameters

    Expect.throws(() {
    new ClassMember2_t03<Future<C1>>().m = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t03<Future<C1>>().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t03<Future<C1>>().test1();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t03<Future<C1>>().test2();
  }, (e) => e is TypeError);
  }
