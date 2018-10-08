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
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as a class member of type T1. Assignment to static and instance class
 * variables is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from right_FutureOr_fail_A01.dart and 
 * class_member_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



import "dart:async";

class S1 {}
class T0 {}

T0 t0Instance = new T0();
FutureOr<S1> t1Instance = new Future.value(new S1());




class ClassMemberTestStatic {
  static FutureOr<S1> s;

  ClassMemberTestStatic(T0 val) {
    s = val; //# 01: compile-time error
  }

  static staticTest() {
    s = t0Instance; //# 04: compile-time error
  }

  static set staticSetter(T0 val) {
    s = val; //# 02: compile-time error
  }

  static FutureOr<S1> get staticGetter => t0Instance; //# 03: compile-time error
}

class ClassMemberTestPublic {
  FutureOr<S1> m;

  ClassMemberTestPublic(T0 val) {
    m = val; //# 05: compile-time error
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(T0 val) {
    m = val; //# 08: compile-time error
  }

  set setter(T0 val) {
    m = val; //# 07: compile-time error
  }

  FutureOr<S1> get getter => t0Instance; //# 09: compile-time error
}

class ClassMemberTestPrivate {
  FutureOr<S1> _m;

  ClassMemberTestPrivate(T0 val) {
    _m = val; //# 10: compile-time error
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(T0 val) {
    _m = val; //# 12: compile-time error
  }

  set setter(T0 val) {
    _m = val; //# 11: compile-time error
  }
}

class ClassMemberTestInitFail {
  static FutureOr<S1> s = t0Instance; //# 13: compile-time error
  FutureOr<S1> m = t0Instance; //# 14: compile-time error
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

