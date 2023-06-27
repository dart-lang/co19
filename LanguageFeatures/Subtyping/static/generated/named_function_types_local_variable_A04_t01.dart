// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
/// Named Function Types:
/// T0 is U0 Function<X0 extends B00, ..., Xk extends B0k>(V0 x0, ..., Vn xn,
///   {r0n+1 Vn+1 xn+1, ..., r0m Vm xm}) where r0j is empty or required for j in
///   n+1...m
/// and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ...,
///   Sn yn, {r1n+1 Sn+1 yn+1, ..., r1q Sq yq}) where r1j is empty or required
///   for j in n+1...q
/// and {yn+1, ... , yq} subsetof {xn+1, ... , xm}
/// and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...n
/// and Si[Z0/Y0, ..., Zk/Yk] <: Tj[Z0/X0, ..., Zk/Xk] for i in n+1...q, yj = xi
/// and for each j such that r0j is required, then there exists an i in n+1...q
///   such that xj = yi, and r1i is required
/// and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
/// and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
/// where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
///
/// @description Check that if T0 and T1 satisfies the rules above, then T0 is
/// subtype of T1. Test generic types with Null type
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/named_function_types_A04.dart and 
/// test_cases/local_variable_x01.dart. Don't modify it! 
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
    {V2<A?, List?, num?>? x2,
    V3<A?, List?, num?>? x3,
    V4<A?, List?, num?>? x4});
typedef T1 = U1<A?, List?, num?> Function<X extends B0, Y extends B1>(
    S0<Null, Null, Null> y0, S1<Null, Null, Null> y1,
    {S2<Null, Null, Null>? x2, S3<Null, Null, Null>? x3});

U0<Null, Null, Null> t0Func<X extends B0, Y extends B1>(
        V0<A?, List?, num?> x0, V1<A?, List?, num?> x1,
        {V2<A?, List?, num?>? x2,
        V3<A?, List?, num?>? x3,
        V4<A?, List?, num?>? x4}) =>
    new U0<Null, Null, Null>();
U1<A?, List?, num?> t1Func<X extends B0, Y extends B1>(
        S0<Null, Null, Null> y0, S1<Null, Null, Null> y1,
        {S2<Null, Null, Null>? x2, S3<Null, Null, Null>? x3}) =>
    new U1<A?, List?, num?>();

T0 t0Instance = t0Func;

class LocalVariableTest {

  LocalVariableTest() {
    T1 t1 = t0Instance;
    t1 = t0Instance;
  }

  static staticTest() {
    T1 t1 = t0Instance;
    t1 = t0Instance;
  }

  test() {
    T1 t1 = t0Instance;
    t1 = t0Instance;
  }
}

main() {
  foo() {
    T1 t1 = t0Instance;
    t1 = t0Instance;
  }

  T1 t1 = t0Instance;
  t1 = t0Instance;
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
