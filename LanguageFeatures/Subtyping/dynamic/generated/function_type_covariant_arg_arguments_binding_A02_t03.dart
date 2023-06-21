// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Function Type/Function: T0 is a function type and T1 is Function
///
/// @description Check that if type `T0` is a function type with a covariant
/// arguments and `T1` is a function type with arguments that are supertypes of
/// `T0` arguments, then `T0` is a subtype of `T1`.
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1. Test mixin members
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/function_type_covariant_arg_A02.dart and 
/// test_cases/arguments_binding_x03.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

class A {
  void foo({required num n, Object o = "A"}) => print("A");
}

class C implements A {
  void foo({required covariant int n, covariant String o = "C"}) => print("C");
}

A a = A();
A c = C();
void Function({required num n, Object o}) t0Instance = c.foo;
void Function({required num n, Object o}) t1Instance = a.foo;

void baz({required num n, Object o = ""}) {}
const t1Default = baz;

mixin class ArgumentsBindingMixin1_t03 {
  void Function({required num n, Object o}) m = t1Default;

  void superTest(void Function({required num n, Object o}) val) {}
  void superTestPositioned(void Function({required num n, Object o}) val, [void Function({required num n, Object o}) val2 = t1Default]) {}
  void superTestNamed(void Function({required num n, Object o}) val, {void Function({required num n, Object o}) val2 = t1Default}) {}
  void Function({required num n, Object o}) get superGetter => m;
  void set superSetter(void Function({required num n, Object o}) val) {}
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
  ArgumentsBinding2_t03<void Function({required num n, Object o})> c2 = new ArgumentsBinding2_t03<void Function({required num n, Object o})>();
  c2.test(forgetType(t0Instance), t1Instance);
  c2.superTest(forgetType(t0Instance));
  c2.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c2.superSetter = forgetType(t0Instance);
}
