// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right FutureOr: T1 is FutureOr<S1> and
///   either T0 <: Future<S1>
///   or T0 <: S1
///   or T0 is X0 and X0 has bound S0 and S0 <: T1
///   or T0 is X0 & S0 and S0 <: T1
/// @description Check that if a type T1 is FutureOr<S1> and a type T0 is not
/// a subtype of types Future<S1> or S1, then a type T0 is not a subtype of a
/// type T1.
/// @author ngl@unipro.ru
///
/// @description Check that if type T0 not a subtype of a type T1, then instance
/// of T0 cannot be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/right_FutureOr_fail_A01.dart and
/// test_cases/return_value_fail_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

import "dart:async";

class S1 {
  const S1();
}
class T0 {}

T0 t0Instance = new T0();

FutureOr<S1> returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static FutureOr<S1> staticTestMethod() => forgetType(t0Instance);

  FutureOr<S1> testMethod() => forgetType(t0Instance);

  FutureOr<S1> get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}

main() {
  FutureOr<S1> returnValueLocalFunc() => forgetType(t0Instance);

  Expect.throws(() {
    returnValueFunc();
  }, (e) => e is TypeError);
  Expect.throws(() {
    returnValueLocalFunc();
  }, (e) => e is TypeError);
  Expect.throws(() {
    ReturnValueTest.staticTestMethod();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ReturnValueTest().testMethod();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ReturnValueTest().testGetter;
  }, (e) => e is TypeError);

  // Test type parameters

  Expect.throws(() {
    new ReturnValueGen<FutureOr<S1>>().testMethod();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ReturnValueGen<FutureOr<S1>>().testGetter;
  }, (e) => e is TypeError);
}
