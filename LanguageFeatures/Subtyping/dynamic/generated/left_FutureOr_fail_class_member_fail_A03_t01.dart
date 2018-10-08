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
 * be used as a class member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_FutureOr_fail_A03.dart and 
 * class_member_fail_x01.dart.
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




class ClassMemberTestStatic {
  static Future<C1> s;

  ClassMemberTestStatic(dynamic val) {
    s = val;
  }

  static staticTest() {
    s = forgetType(t0Instance);
  }

  static set staticSetter(dynamic val) {
    s = val;
  }

  static Future<C1> get staticGetter => forgetType(t0Instance);
}

class ClassMemberTestPublic {
  Future<C1> m;

  ClassMemberTestPublic(dynamic val) {
    m = val;
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(dynamic val) {
    m = val;
  }

  set setter(dynamic val) {
    m = val;
  }

  Future<C1> get getter => forgetType(t0Instance);
}

class ClassMemberTestPrivate {
  Future<C1> _m;

  ClassMemberTestPrivate(dynamic val) {
    _m = val;
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(dynamic val) {
    _m = val;
  }

  set setter(dynamic val) {
    _m = val;
  }
}

class ClassMemberTestInitFail {
  static Future<C1> s = forgetType(t0Instance);
  Future<C1> m = forgetType(t0Instance);
}

class ClassMemberTestGenericPublic<X> {
  X m;

  ClassMemberTestGenericPublic(dynamic val) {
    m = val;
  }

  ClassMemberTestGenericPublic.short(this.m);

  ClassMemberTestGenericPublic.validConstructor() {}

  test(dynamic val) {
    m = val;
  }

  set setter(dynamic val) {
    m = val;
  }

  X get getter => forgetType(t0Instance);
}

class ClassMemberTestGenericPrivate<X> {
  X _m;

  ClassMemberTestGenericPrivate(dynamic val) {
    _m = val;
  }

  ClassMemberTestGenericPrivate.short(this._m);

  ClassMemberTestGenericPrivate.validConstructor() {}

  test(dynamic val) {
    _m = val;
  }

  set setter(dynamic val) {
    _m = val;
  }
}


main() {

  // Test initialization
  Expect.throws(() {ClassMemberTestInitFail.s;}, (e) => e is TypeError);
  Expect.throws(() {new ClassMemberTestInitFail();}, (e) => e is TypeError);

  // Test constructors
  Expect.throws(() {
    new ClassMemberTestPublic(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPublic.short(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPrivate(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPrivate.short(forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test class variables
  Expect.throws(() {
    new ClassMemberTestPublic.validConstructor().m = forgetType(t0Instance);
  }, (e) => e is TypeError);

  // Test setters
  Expect.throws(() {
    new ClassMemberTestPublic.validConstructor().setter = t0Instance;
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPrivate.validConstructor().setter = t0Instance;
  }, (e) => e is TypeError);

  // Test methods
  Expect.throws(() {
    new ClassMemberTestPublic.validConstructor().test(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPrivate.validConstructor().test(t0Instance);
  }, (e) => e is TypeError);

  // Test getters
  Expect.throws(() {
    new ClassMemberTestPublic.validConstructor().getter;
  }, (e) => e is TypeError);


  // Test static stuff
  Expect.throws(() {
    new ClassMemberTestStatic(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    ClassMemberTestStatic.staticSetter = t0Instance;
  }, (e) => e is TypeError);

  Expect.throws(() {
    ClassMemberTestStatic.staticGetter;
  }, (e) => e is TypeError);

  Expect.throws(() {
    ClassMemberTestStatic.staticTest();
  }, (e) => e is TypeError);

  // Test type parameters

    // Test getters
  Expect.throws(() {
    new ClassMemberTestGenericPublic<Future<C1>>.validConstructor().getter;
  }, (e) => e is TypeError);

  // Test methods
  Expect.throws(() {
    new ClassMemberTestGenericPublic<Future<C1>>.validConstructor().test(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<Future<C1>>.validConstructor().test(t0Instance);
  }, (e) => e is TypeError);

  // Test setters
  Expect.throws(() {
    new ClassMemberTestGenericPublic<Future<C1>>.validConstructor().setter = t0Instance;
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<Future<C1>>.validConstructor().setter = t0Instance;
  }, (e) => e is TypeError);

  // Test class variables
  Expect.throws(() {
    new ClassMemberTestGenericPublic<Future<C1>>.validConstructor().m = forgetType(t0Instance);
  }, (e) => e is TypeError);

  // Test constructors
  Expect.throws(() {
    new ClassMemberTestGenericPublic<Future<C1>>(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPublic<Future<C1>>.short(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<Future<C1>>(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<Future<C1>>.short(forgetType(t0Instance));
  }, (e) => e is TypeError);
  }
