// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Type Variable Reflexivity 1: T0 is a type variable X0 or a promoted type
/// variables X0 & S0 and T1 is X0
/// @description Check that if type T0 a promoted type variables X0 & S0 and T1
/// is X0 then T0 is a subtype of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1. Test mixin members
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/type_variable_reflexivity_1_A01.dart and
/// test_cases/arguments_binding_x03.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

class X0 {
  const X0();
}
class S0 extends X0 {
}

X0 t0Instance = new S0();
X0 t1Instance = new X0();

const t1Default = const X0();

mixin ArgumentsBindingMixin1_t03 {
  X0 m = t1Default;

  void superTest(X0 val) {}
  void superTestPositioned(X0 val, [X0 val2 = t1Default]) {}
  void superTestNamed(X0 val, {X0 val2 = t1Default}) {}
  X0 get superGetter => m;
  void set superSetter(X0 val) {}
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

mixin ArgumentsBindingMixin2_t03<X> {
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
  X0 t0Instance = new S0();
  if (t0Instance is S0) {
    ArgumentsBinding1_t03 c1 = new ArgumentsBinding1_t03();

    c1.test(t0Instance, t1Instance);
    c1.superTest(t0Instance);
    c1.superTestPositioned(t0Instance);
    c1.superTestPositioned(t1Instance, t0Instance);
    c1.superTestNamed(t0Instance);
    c1.superTestNamed(t1Instance, val2: t0Instance);
    c1.superSetter = t0Instance;
    c1.superGetter;

    // Test type parameters
    ArgumentsBinding2_t03<X0> c2 = new ArgumentsBinding2_t03<X0>();
    c2.test(t0Instance, t1Instance);
    c2.superTest(t0Instance);
    c2.superTestNamed(t1Instance, val2: t0Instance);
    c2.superSetter = t0Instance;
  }
}
