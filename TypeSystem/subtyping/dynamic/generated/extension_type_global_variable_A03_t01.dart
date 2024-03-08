// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Assume that T1, .. Ts are types, and V resolves to an extension type
/// declaration of the following form:
///
/// extension type V<X1 extends B1, .. Xs extends Bs>(T id) ... {
///   ... // Members.
/// }
/// It is then allowed to use V<T1, .. Tk> as a type.
///
/// @description Check that if type `T0` is an extension type `V` with nullable
/// representation type then it is subtype of `Object?`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to global variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_A03.dart and
/// test_cases/global_variable_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

extension type const V<T>(T id) {}

Object? t1Instance = null;
V<int?> t0Instance = V<int?>(42);

class GlobalVariableTest {
  GlobalVariableTest() {
    t1Instance = forgetType(t0Instance);
  }

  foo() {
    t1Instance = forgetType(t0Instance);
  }

  static test() {
    t1Instance = forgetType(t0Instance);
  }
}

main() {
  bar () {
    t1Instance = forgetType(t0Instance);
  }

  t1Instance = forgetType(t0Instance);
  bar();
  GlobalVariableTest t = new GlobalVariableTest();
  t.foo();
  GlobalVariableTest.test();
}
