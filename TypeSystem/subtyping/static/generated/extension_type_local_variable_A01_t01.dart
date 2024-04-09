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
/// @description Check that if type `T0` is an extension type `V<T1, .. Ts>` and
/// `T1` is an extension type `V<X1, .. Ss>` then `T0` is a subtype of `T1` if
/// all `Ti <: Xi`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_A01.dart and
/// test_cases/local_variable_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

extension type const V<T1 extends num, T2 extends Object>(T1 id) {}

V<int, String> t0Instance = V<int, String>(42);

class LocalVariableTest {

  LocalVariableTest() {
    V<num, Object> t1 = t0Instance;
    t1 = t0Instance;
  }

  static staticTest() {
    V<num, Object> t1 = t0Instance;
    t1 = t0Instance;
  }

  test() {
    V<num, Object> t1 = t0Instance;
    t1 = t0Instance;
  }
}

main() {
  foo() {
    V<num, Object> t1 = t0Instance;
    t1 = t0Instance;
  }

  V<num, Object> t1 = t0Instance;
  t1 = t0Instance;
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
