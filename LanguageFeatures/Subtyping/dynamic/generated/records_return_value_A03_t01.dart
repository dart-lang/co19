// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// A record type A is a subtype of record type B iff they have same shape and
/// the types of all fields of A are subtypes of the corresponding field types
/// of B
///
/// @description Check that if type T0 is a record with the same shape as T1
/// and the type of each field of T0 is a subtype of the corresponding field
/// types of T1 then T0 is a subtype of T1. Check named fields only
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/records_A03.dart and 
/// test_cases/return_value_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

// SharedOptions=--enable-experiment=records

({int x, double y, String z}) t0Instance = (x: 42, y: 3.14, z: "");
({String? z, num y, num x}) t1Instance = (y: 1, z: null, x: 0.1);

const t1Default = (y: 1, z: null, x: 0.1);

({String? z, num y, num x}) returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static ({String? z, num y, num x}) staticTestMethod() => forgetType(t0Instance);

  ({String? z, num y, num x}) testMethod() => forgetType(t0Instance);

  ({String? z, num y, num x}) get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}

main() {
  ({String? z, num y, num x}) returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  // Test type parameters

  //# <-- NotGenericFunctionType
  new ReturnValueGen<({String? z, num y, num x})>().testMethod();
  new ReturnValueGen<({String? z, num y, num x})>().testGetter;
  //# -->
}
