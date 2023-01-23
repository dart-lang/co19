// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left FutureOr: T0 is FutureOr<S0>
///   and Future<S0> <: T1
///   and S0 <: T1
/// @description Check that if a type T0 is FutureOr<S0> and S0 is a subtype of
/// T1 but Future<S0> is not a subtype of T1, then a type T0 is not a subtype of
/// a type T1. Case when an instance of T0 is an instance of Future<S0> type.
/// @author ngl@unipro.ru
///
/// @description Check that if type T0 not a subtype of a type T1, then instance
/// of T0 cannot be used as a return value of type T1. Return value is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from left_FutureOr_fail_A03.dart and 
/// return_value_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


// @dart = 2.9



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


// @dart = 2.9


Future<C1> returnValueFunc() => t0Instance;
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ReturnValueTest {
  static Future<C1> staticTestMethod() => t0Instance;
//                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Future<C1> testMethod() => t0Instance;
//                    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Future<C1> get testGetter => t0Instance;
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  returnValueFunc();

  Future<C1> returnValueLocalFunc() => t0Instance;
//                              ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();
  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;
}
