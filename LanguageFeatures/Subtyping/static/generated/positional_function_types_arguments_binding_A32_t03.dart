// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
/// Positional Function Types: T0 is U0 Function<X0 extends B00, ...,
/// Xk extends B0k>(V0 x0, ..., Vn xn, [Vn+1 xn+1, ..., Vm xm])
///
///  and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ...,
///  Sp yp, [Sp+1 yp+1, ..., Sq yq])
///  and p >= n
///  and m >= q
///  and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...q
///  and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
///  and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
///  where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
/// @description Check that if T0 and T1 satisfies the rules above, then T0 is
/// subtype of T1. Test generic types with Null type when p > n and m > q.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1. Test mixin members
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/positional_function_types_A32.dart and 
/// test_cases/arguments_binding_x03.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

class A {}

class C extends A {}

class U0<X, Y, Z> extends U1<X, Y, Z> {}

class U1<X, Y, Z> {}

class B0<X, Y, Z> {}

class B1<X, Y, Z> {}

class V0<X, Y, Z> {}

class V1<X, Y, Z> {}

class V2<X, Y, Z> {}

class V3<X, Y, Z> {}

class V4<X, Y, Z> {}

class S0<X, Y, Z> extends V0<X, Y, Z> {}

class S1<X, Y, Z> extends V1<X, Y, Z> {}

class S2<X, Y, Z> extends V2<X, Y, Z> {}

class S3<X, Y, Z> extends V3<X, Y, Z> {}

class X0<X, Y, Z> extends B0<X, Y, Z> {}

class X1<X, Y, Z> extends B1<X, Y, Z> {}

class Y0<X, Y, Z> extends B0<X, Y, Z> {}

class Y1<X, Y, Z> extends B1<X, Y, Z> {}

typedef T0 = U0<Null, Null, Null> Function<X extends B0, Y extends B1>(
    V0<A?, List?, num?> x0, V1<A?, List?, num?> x1,
    [V2<A?, List?, num?>? x2,
    V3<A?, List?, num?>? x3,
    V4<A?, List?, num?>? x4]);
typedef T1 = U1<A?, List?, num?> Function<X extends B0, Y extends B1>(
    S0<Null, Null, Null> y0, S1<Null, Null, Null> y1, S2<Null, Null, Null> x2,
    [S3<Null, Null, Null>? x3]);

U0<Null, Null, Null> t0Func<X extends B0, Y extends B1>(
        V0<A?, List?, num?> x0, V1<A?, List?, num?> x1,
        [V2<A?, List?, num?>? x2,
        V3<A?, List?, num?>? x3,
        V4<A?, List?, num?>? x4]) =>
    new U0<Null, Null, Null>();
U1<A?, List?, num?> t1Func<X extends B0, Y extends B1>(S0<Null, Null, Null> y0,
        S1<Null, Null, Null> y1, S2<Null, Null, Null> x2,
        [S3<Null, Null, Null>? x3]) =>
    new U1<A?, List?, num?>();

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;
const t1Default = t1Func;

mixin ArgumentsBindingMixin1_t03 {
  T1 m = t1Default;

  void superTest(T1 val) {}
  void superTestPositioned(T1 val, [T1 val2 = t1Default]) {}
  void superTestNamed(T1 val, {T1 val2 = t1Default}) {}
  T1 get superGetter => m;
  void set superSetter(T1 val) {}
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
  ArgumentsBinding2_t03<T1> c2 = new ArgumentsBinding2_t03<T1>();
  c2.test(t0Instance, t1Instance);
  c2.superTest(t0Instance);
  c2.superTestNamed(t1Instance, val2: t0Instance);
  c2.superSetter = t0Instance;
}
