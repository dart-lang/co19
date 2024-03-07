// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Assume that DV declares an extension type declaration named Name with type
/// parameters X1 .. Xs, and V1 is a superinterface of DV. Then Name<T1, .. Ts>
/// is a subtype of [T1/X1 .. Ts/Xs]V1 for all T1, .. Ts.
///
/// @description Check that an extension type `ET<T1, ..., Ts>` is a subtype of
/// an extension type `ET<X1, ..., Xs>` if `Ti` is a subtype of `Xi` for all `i`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_A08.dart and
/// test_cases/return_value_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

extension type const ET<T>(T id) {}

ET<String> t0Instance = ET("42");

ET<Object> returnValueFunc() => t0Instance;

class ReturnValueTest {
  static ET<Object> staticTestMethod() => t0Instance;

  ET<Object> testMethod() => t0Instance;

  ET<Object> get testGetter => t0Instance;
}

main() {
  ET<Object> returnValueLocalFunc() => t0Instance;

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;
}
