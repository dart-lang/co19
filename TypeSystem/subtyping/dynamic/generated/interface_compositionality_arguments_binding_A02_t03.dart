// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Interface Compositionality: T0 is an interface type
/// C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and each Si <: Ui
/// @description Check that if type T0 is an interface type
/// C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and each Si <: Ui then T0 is a
/// subtype of T1
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1. Test mixin members
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/interface_compositionality_A02.dart and
/// test_cases/arguments_binding_x03.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

abstract class U0 {}
abstract mixin class U1 {}
abstract mixin class U2 {}

abstract class S0 extends U0 {}
abstract class S1 extends Object with U1 {}
class S2 = Object with U2;

class C0<X, Y, Z> {
  const C0();
}

C0<S0, S1, S2> t0Instance = new C0<S0, S1, S2>();
C0<U0, U1, U2> t1Instance = new C0<U0, U1, U2>();

const t1Default = const C0<U0, U1, U2>();

mixin class ArgumentsBindingMixin1_t03 {
  C0<U0, U1, U2> m = t1Default;

  void superTest(C0<U0, U1, U2> val) {}
  void superTestPositioned(C0<U0, U1, U2> val, [C0<U0, U1, U2> val2 = t1Default]) {}
  void superTestNamed(C0<U0, U1, U2> val, {C0<U0, U1, U2> val2 = t1Default}) {}
  C0<U0, U1, U2> get superGetter => m;
  void set superSetter(C0<U0, U1, U2> val) {}
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
  ArgumentsBinding2_t03<C0<U0, U1, U2>> c2 = new ArgumentsBinding2_t03<C0<U0, U1, U2>>();
  c2.test(forgetType(t0Instance), t1Instance);
  c2.superTest(forgetType(t0Instance));
  c2.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c2.superSetter = forgetType(t0Instance);
}
