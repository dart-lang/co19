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
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as a class member of type T1. Assignment to static and instance class
 * variables is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from left_FutureOr_fail_A03.dart and 
 * class_member_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



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




class ClassMemberTestStatic {
  static Future<C1> s;

  ClassMemberTestStatic(FutureOr<S0> val) {
    s = val; //# 01: compile-time error
  }

  static staticTest() {
    s = t0Instance; //# 04: compile-time error
  }

  static set staticSetter(FutureOr<S0> val) {
    s = val; //# 02: compile-time error
  }

  static Future<C1> get staticGetter => t0Instance; //# 03: compile-time error
}

class ClassMemberTestPublic {
  Future<C1> m;

  ClassMemberTestPublic(FutureOr<S0> val) {
    m = val; //# 05: compile-time error
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(FutureOr<S0> val) {
    m = val; //# 08: compile-time error
  }

  set setter(FutureOr<S0> val) {
    m = val; //# 07: compile-time error
  }

  Future<C1> get getter => t0Instance; //# 09: compile-time error
}

class ClassMemberTestPrivate {
  Future<C1> _m;

  ClassMemberTestPrivate(FutureOr<S0> val) {
    _m = val; //# 10: compile-time error
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(FutureOr<S0> val) {
    _m = val; //# 12: compile-time error
  }

  set setter(FutureOr<S0> val) {
    _m = val; //# 11: compile-time error
  }
}

class ClassMemberTestInitFail {
  static Future<C1> s = t0Instance; //# 13: compile-time error
  Future<C1> m = t0Instance; //# 14: compile-time error
}


main() {
  new ClassMemberTestStatic(t0Instance); //# 01: compile-time error
  ClassMemberTestStatic.staticSetter = t0Instance; //# 02: compile-time error
  ClassMemberTestStatic.staticGetter; //# 03: compile-time error
  ClassMemberTestStatic.staticTest(); //# 04: compile-time error
  new ClassMemberTestPublic(t0Instance); //# 05: compile-time error
  new ClassMemberTestPublic.validConstructor().m = t0Instance; //# 06: compile-time error
  new ClassMemberTestPublic.validConstructor().setter = t0Instance; //# 07: compile-time error
  new ClassMemberTestPublic.validConstructor().test(t0Instance); //# 08: compile-time error
  new ClassMemberTestPublic.validConstructor().getter; //# 09: compile-time error
  new ClassMemberTestPrivate(t0Instance); //# 10: compile-time error
  new ClassMemberTestPrivate.validConstructor().setter = t0Instance; //# 11: compile-time error
  new ClassMemberTestPrivate.validConstructor().test(t0Instance); //# 12: compile-time error
  ClassMemberTestInitFail.s; //# 13: compile-time error
  new ClassMemberTestInitFail(); //# 14: compile-time error
}

