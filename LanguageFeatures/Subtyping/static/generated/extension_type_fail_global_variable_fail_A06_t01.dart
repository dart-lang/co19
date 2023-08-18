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
/// @description Check that if type `T0` is an extension type `V` with a
/// non-nullable representation type then `Object` is not subtype of `V`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be assigned to the to global variable of type T1.
/// Assignment to global variable is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from test_types/extension_type_fail_A06.dart and 
/// test_cases/global_variable_fail_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=inline-class

extension type const V<T>(T id) {}

V<Object> t1Instance = V<Object>(42);
Object t0Instance = Object();

class GlobalVariableTest {
  GlobalVariableTest() {
    t1Instance = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  foo() {
    t1Instance = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  static test() {
    t1Instance = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  t1Instance = t0Instance;
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  bar () {
    t1Instance = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
