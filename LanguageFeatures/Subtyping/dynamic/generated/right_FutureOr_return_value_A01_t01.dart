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
/// @description Check that if a type T1 is FutureOr<S1> and a type T0 is a
/// subtype of a type Future<S1>, then a type T0 is a subtype of a type T1.
/// @author ngl@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from right_FutureOr_A01.dart and 
/// return_value_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


import '../../utils/common.dart';

import "dart:async";

class S1 {
  const S1();
}

bool testDef(Object error) => true;
void onErrorDef() {}
FutureOr<S1> onTimeoutDef() => new S1();

class T0 implements Future<S1> {
  asStream() => getStream<S1>();
  catchError(Function onError, {bool test(Object error)? = testDef}) => new Future.value();
  then<T0>(FutureOr<T0> onValue(S1 value), {Function? onError = onErrorDef}) => new Future<T0>.value();
  timeout(Duration timeLimit, {FutureOr<S1> onTimeout()? = onTimeoutDef}) => new Future.value();
  whenComplete(FutureOr action()) => new Future.value();
}

Stream<T> getStream<T>() {
  dynamic d = "";
  return d as Stream<T>;
}

T0 t0Instance = new T0();
FutureOr<S1> t1Instance = new Future.value(new S1());

const t1Default = const S1();




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

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  // Test type parameters

  //# <-- NotGenericFunctionType
  new ReturnValueGen<FutureOr<S1>>().testMethod();
  new ReturnValueGen<FutureOr<S1>>().testGetter;
  //# -->
}
