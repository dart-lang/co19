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
 * @description Check that if type T0 not a subtype of a type T1, then instance
 * of T0 cannot be be used as a return value of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_FutureOr_fail_A03.dart and 
 * return_value_fail_x01.dart.
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




Future<C1> returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static Future<C1> staticTestMethod() => forgetType(t0Instance);

  Future<C1> testMethod() => forgetType(t0Instance);

  Future<C1> get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}

main() {
  Future<C1> returnValueLocalFunc() => forgetType(t0Instance);

  Expect.throws(() {returnValueFunc();}, (e) => e is TypeError);
  Expect.throws(() {returnValueLocalFunc();}, (e) => e is TypeError);
  Expect.throws(() {ReturnValueTest.staticTestMethod();}, (e) => e is TypeError);

  Expect.throws(() {new ReturnValueTest().testMethod();}, (e) => e is TypeError);
  Expect.throws(() {new ReturnValueTest().testGetter;}, (e) => e is TypeError);

  // Test type parameters

    Expect.throws(() {new ReturnValueGen<Future<C1>>().testMethod();}, (e) => e is TypeError);
  Expect.throws(() {new ReturnValueGen<Future<C1>>().testGetter;}, (e) => e is TypeError);
  }
