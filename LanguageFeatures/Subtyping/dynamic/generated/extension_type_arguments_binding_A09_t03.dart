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
/// @description Check that at run time an extension type is identical to its
/// representation type
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1. Test mixin members
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_A09.dart and 
/// test_cases/arguments_binding_x03.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=inline-class

import '../../utils/common.dart';

extension type const V<T>(T id) {}

V<String> t1Instance = V<String>("42");
String t0Instance = "1";

const t1Default = V<String>("0");

mixin class ArgumentsBindingMixin1_t03 {
  V<String> m = t1Default;

  void superTest(V<String> val) {}
  void superTestPositioned(V<String> val, [V<String> val2 = t1Default]) {}
  void superTestNamed(V<String> val, {V<String> val2 = t1Default}) {}
  V<String> get superGetter => m;
  void set superSetter(V<String> val) {}
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingMixin1_t03 {

  test(dynamic t1, dynamic t2) {
    superTest(t1);
    superTestPositioned(t1);
    superTestPositioned(t2, t1);
    superTestNamed(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}

mixin class ArgumentsBindingMixin2_t03<X> {
  void superTest(X val) {}
  void superTestNamed(X val, {required X val2}) {}
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t03<X> extends Object with ArgumentsBindingMixin2_t03<X> {

  test(dynamic t1, dynamic t2) {
    superTest(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
  }
}

main() {
  ArgumentsBinding1_t03 c1 = new ArgumentsBinding1_t03();

  c1.test(forgetType(t0Instance), t1Instance);
  c1.superTest(forgetType(t0Instance));
  c1.superTestPositioned(forgetType(t0Instance));
  c1.superTestPositioned(t1Instance, forgetType(t0Instance));
  c1.superTestNamed(forgetType(t0Instance));
  c1.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c1.superSetter = forgetType(t0Instance);
  c1.superGetter;

  // Test type parameters
  ArgumentsBinding2_t03<V<String>> c2 = new ArgumentsBinding2_t03<V<String>>();
  c2.test(forgetType(t0Instance), t1Instance);
  c2.superTest(forgetType(t0Instance));
  c2.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c2.superSetter = forgetType(t0Instance);
}
