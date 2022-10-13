// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right Promoted Variable: if T1 is a promoted type variable X1 & S1 then:
/// - T0 <: T1 iff T0 <: X1 and T0 <: S1
/// @description Check that if type T1 is a promoted type variables X1 & S1 and
/// T0 <: X1 and T0 <: S1 then T0 is a subtype of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1. Test superclass members
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/right_promoted_variable_A01.dart and 
/// test_cases/arguments_binding_x02.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

class X1 {
  const X1();
}
class S1 extends X1 {
  const S1();
}

class T0 extends S1 {}

T0 t0Instance = new T0();
X1 t1Instance = new S1();

const t1Default = const S1();

class ArgumentsBindingSuper1_t02 {
  S1 m = t1Default;

  ArgumentsBindingSuper1_t02(S1 value): m = value {}
  ArgumentsBindingSuper1_t02.named(S1 value, {S1 val2 = t1Default}): m = value {}
  ArgumentsBindingSuper1_t02.positional(S1 value, [S1 val2 = t1Default]): m = value {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(S1 val) {}
  void superTestPositioned(S1 val, [S1 val2 = t1Default]) {}
  void superTestNamed(S1 val, {S1 val2 = t1Default}) {}
  S1 get superGetter => m;
  void set superSetter(S1 val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(dynamic t1) : super(t1) {}
  ArgumentsBinding1_t02.c1(dynamic t1) : super.named(t1) {}
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

  ArgumentsBindingSuper2_t02(X value): m = value {}
  ArgumentsBindingSuper2_t02.named(X value, {required X val2}): m = value {}
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
  X1 t1Instance = new S1();
  if (t1Instance is S1) {
    ArgumentsBinding1_t02 c1 = new ArgumentsBinding1_t02(t0Instance);
    c1 = new ArgumentsBinding1_t02.c1(t0Instance);
    c1 = new ArgumentsBinding1_t02.c2(t1Instance, t0Instance);
    c1 = new ArgumentsBinding1_t02.c3(t0Instance);
    c1 = new ArgumentsBinding1_t02.c4(t1Instance, t0Instance);
    c1 = new ArgumentsBinding1_t02.c5(t0Instance);

    c1.test(t0Instance, t1Instance);
    c1.superTest(t0Instance);
    c1.superTestPositioned(t0Instance);
    c1.superTestPositioned(t1Instance, t0Instance);
    c1.superTestNamed(t0Instance);
    c1.superTestNamed(t1Instance, val2: t0Instance);
    c1.superSetter = t0Instance;
    c1.superGetter;

    // Test type parameters
    ArgumentsBinding2_t02<S1> c2 =
      new ArgumentsBinding2_t02<S1>(t0Instance);
    c2 = new ArgumentsBinding2_t02<S1>.c2(t1Instance, t0Instance);
    c2 = new ArgumentsBinding2_t02<S1>.c5(t0Instance);

    c2.test(t0Instance, t1Instance);
    c2.superTest(t0Instance);
    c2.superTestNamed(t1Instance, val2: t0Instance);
    c2.superSetter = t0Instance;
    c2.superGetter;
  }
}
