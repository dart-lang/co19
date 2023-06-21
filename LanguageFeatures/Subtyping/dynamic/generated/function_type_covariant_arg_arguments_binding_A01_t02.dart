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
/// of T0 can be used as an argument of type T1. Test superclass members
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/function_type_covariant_arg_A01.dart and 
/// test_cases/arguments_binding_x02.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

class A {
  void foo(num n, [Object o = "A"]) => print("A");
}

class C implements A {
  void foo(covariant int n, [covariant String c = "C"]) => print("C");
}

A a = A();
A c = C();
void Function(num n, [Object o]) t0Instance = c.foo;
void Function(num n, [Object o]) t1Instance = a.foo;

void baz(num n, [Object o = ""]) {}
const t1Default = baz;

class ArgumentsBindingSuper1_t02 {
  void Function(num n, [Object o]) m;

  ArgumentsBindingSuper1_t02(void Function(num n, [Object o]) value): m = value {}
  ArgumentsBindingSuper1_t02.named(void Function(num n, [Object o]) value, {void Function(num n, [Object o]) val2 = t1Default}): m = value {}
  ArgumentsBindingSuper1_t02.positional(void Function(num n, [Object o]) value, [void Function(num n, [Object o]) val2 = t1Default]): m = value {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(void Function(num n, [Object o]) val) {}
  void superTestPositioned(void Function(num n, [Object o]) val, [void Function(num n, [Object o]) val2 = t1Default]) {}
  void superTestNamed(void Function(num n, [Object o]) val, {void Function(num n, [Object o]) val2 = t1Default}) {}
  void Function(num n, [Object o]) get superGetter => m;
  void set superSetter(void Function(num n, [Object o]) val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(dynamic t1) : super(t1) {}
  ArgumentsBinding1_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding1_t02.c3(dynamic t1) : super.positional(t1) {}
  ArgumentsBinding1_t02.c4(dynamic t1, dynamic t2) : super.positional(t1, t2) {}
  ArgumentsBinding1_t02.c5(dynamic t1) : super.short(t1) {}

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

class ArgumentsBindingSuper2_t02<X> {
  X m;

  ArgumentsBindingSuper2_t02(X value) : m = value {}
  ArgumentsBindingSuper2_t02.named(X value, {required X val2}) : m = value {}
  ArgumentsBindingSuper2_t02.short(this.m);

  void superTest(X val) {}
  void superTestNamed(X val, {required X val2}) {}
  X get superGetter => m;
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t02<X> extends ArgumentsBindingSuper2_t02<X> {
  ArgumentsBinding2_t02(X t1) : super(t1) {}
  ArgumentsBinding2_t02.c2(X t1, X t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding2_t02.c5(X t1) : super.short(t1) {}

  test(X t1, X t2) {
    superTest(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}

main() {
  ArgumentsBinding1_t02 c1 = new ArgumentsBinding1_t02(t0Instance);
  c1 = new ArgumentsBinding1_t02.c2(t1Instance, t0Instance);
  c1 = new ArgumentsBinding1_t02.c3(t0Instance);
  c1 = new ArgumentsBinding1_t02.c4(t1Instance, t0Instance);
  c1 = new ArgumentsBinding1_t02.c5(t0Instance);

  c1.test(t0Instance, t1Instance);
  c1.superTest(forgetType(t0Instance));
  c1.superTestPositioned(forgetType(t0Instance));
  c1.superTestPositioned(t1Instance, forgetType(t0Instance));
  c1.superTestNamed(forgetType(t0Instance));
  c1.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c1.superSetter = forgetType(t0Instance);
  c1.superGetter;

  // Test type parameters

  ArgumentsBinding2_t02<void Function(num n, [Object o])> c2 =
    new ArgumentsBinding2_t02<void Function(num n, [Object o])>(forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<void Function(num n, [Object o])>.c2(t1Instance, forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<void Function(num n, [Object o])>.c5(forgetType(t0Instance));

  c2.test(forgetType(t0Instance), t1Instance);
  c2.superTest(forgetType(t0Instance));
  c2.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c2.superSetter = forgetType(t0Instance);
  c2.superGetter;
}
