// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Assume that DV declares an extension type declaration named Name with type
/// parameters X1 .. Xs, and V1 is a superinterface of DV. Then Name<T1, .. Ts>
/// is a subtype of [T1/X1 .. Ts/Xs]V1 for all T1, .. Ts.
///
/// @description Check that if type `T0` is an extension type `V` with type
/// parameters `X1 .. Xs`, and `V1` is a superinterface of `V`, then `V` is a
/// subtype of `[T1/X1 .. Ts/Xs]V1` for all `T1, .. Ts`.
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_A04.dart and
/// test_cases/local_variable_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=inline-class

import '../../utils/common.dart';

extension type const V1<T1, T2>(T1 id) {}

extension type V<T1, T2>(T1 id) implements V1<T1, T2> {}

V<int, String> t0Instance = V<int, String>(42);

class LocalVariableTest {

  LocalVariableTest() {
    V1<num, Object> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  static staticTest() {
    V1<num, Object> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  test() {
    V1<num, Object> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }
}

main() {
  foo() {
    V1<num, Object> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  V1<num, Object> t1 = forgetType(t0Instance);
  t1 = forgetType(t0Instance);
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
