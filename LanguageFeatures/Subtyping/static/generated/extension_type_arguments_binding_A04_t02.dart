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
/// of T0 can be used as an argument of type T1. Test superclass members
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_A04.dart and
/// test_cases/arguments_binding_x02.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=inline-class

extension type const V1<T1, T2>(T1 id) {}

extension type V<T1, T2>(T1 id) implements V1<T1, T2> {}

V1<num, Object> t1Instance = V1<num, Object>(0);
V<int, String> t0Instance = V<int, String>(42);

const t1Default = const V1<num, Object>(0);

class ArgumentsBindingSuper1_t02 {
  V1<num, Object> m = t1Default;

  ArgumentsBindingSuper1_t02(V1<num, Object> value): m = value {}
  ArgumentsBindingSuper1_t02.named(V1<num, Object> value, {V1<num, Object> val2 = t1Default}): m = value {}
  ArgumentsBindingSuper1_t02.positional(V1<num, Object> value, [V1<num, Object> val2 = t1Default]): m = value {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(V1<num, Object> val) {}
  void superTestPositioned(V1<num, Object> val, [V1<num, Object> val2 = t1Default]) {}
  void superTestNamed(V1<num, Object> val, {V1<num, Object> val2 = t1Default}) {}
  V1<num, Object> get superGetter => m;
  void set superSetter(V1<num, Object> val) {}
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
  ArgumentsBinding2_t02<V1<num, Object>> c2 =
    new ArgumentsBinding2_t02<V1<num, Object>>(t0Instance);
  c2 = new ArgumentsBinding2_t02<V1<num, Object>>.c2(t1Instance, t0Instance);
  c2 = new ArgumentsBinding2_t02<V1<num, Object>>.c5(t0Instance);

  c2.test(t0Instance, t1Instance);
  c2.superTest(t0Instance);
  c2.superTestNamed(t1Instance, val2: t0Instance);
  c2.superSetter = t0Instance;
  c2.superGetter;
}
