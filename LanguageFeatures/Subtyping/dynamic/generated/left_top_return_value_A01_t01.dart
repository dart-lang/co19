// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Top: if T0 is dynamic or void then T0 <: T1 if Object? <: T1
/// @description Check that if type T0 is dynamic and Object? <: T1 then T0 is a
/// subtype of a type T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/left_top_A01.dart and
/// test_cases/return_value_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

dynamic t0Instance = "Show must go on";

Object? returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static Object? staticTestMethod() => forgetType(t0Instance);

  Object? testMethod() => forgetType(t0Instance);

  Object? get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}

main() {
  Object? returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  // Test type parameters

  new ReturnValueGen<Object?>().testMethod();
  new ReturnValueGen<Object?>().testGetter;
}
