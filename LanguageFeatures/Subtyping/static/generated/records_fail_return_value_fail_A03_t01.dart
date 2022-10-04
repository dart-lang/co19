// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// A record type A is a subtype of record type B iff they have same shape and
/// the types of all fields of A are subtypes of the corresponding field types
/// of B
///
/// @description Check that if type T0 is a record with another shape than T1
/// then T0 is not a subtype of T1
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 not a subtype of a type T1, then instance
/// of T0 cannot be used as a return value of type T1. Return value is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from test_types/records_fail_A03.dart and 
/// test_cases/return_value_fail_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=records

(int, String, {bool b}) t0Instance = (1, "2", b: true);
(int, String) t1Instance = (3, "4");

const t1Default = const (5, "6");

(int i, String s) returnValueFunc() => t0Instance;
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ReturnValueTest {
  static (int i, String s) staticTestMethod() => t0Instance;
//                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  (int i, String s) testMethod() => t0Instance;
//                    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (int i, String s) get testGetter => t0Instance;
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  (int i, String s) returnValueLocalFunc() => t0Instance;
//                              ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
