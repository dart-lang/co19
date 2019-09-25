/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
 * Named Function Types: T0 is U0 Function<X0 extends B00, ..., Xk extends B0k>
 *   (T0 x0, ..., Tn xn, {Tn+1 xn+1, ..., Tm xm})
 *
 * and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ..., Sn yn,
 * {Sn+1 yn+1, ..., Sq yq})
 * and {yn+1, ... , yq} subsetof {xn+1, ... , xm}
 * and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...n
 * and Si[Z0/Y0, ..., Zk/Yk] <: Tj[Z0/X0, ..., Zk/Xk] for i in n+1...q, yj = xi
 * and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
 * and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
 * where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
 * @description Check that if  B0i[Z0/X0, ..., Zk/Xk] !== B1i[Z0/Y0, ..., Zk/Yk]
 * for any i in 0...k, then T0 is not a subtype of T1. Test generic types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class A {}

class C extends A {}

class U<X, Y, Z>{}

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

typedef T0 = U<C, List<String>, int> Function<X extends B0, Y extends B1>(
    V0<A, List, num> x0, V1<A, List, num> x1,
    {V2<A, List, num>? x2, V3<A, List, num>? x3, V4<A, List, num>? x4});
typedef T1 = U<A, List, int> Function<X extends B0, Y extends B0>(  //Y extends B0, not B1
    S0<C, List<String>, int> y0, S1<C, List<String>, int> y1,
    {S2<C, List<String>, int>? x2, S3<C, List<String>, int>? x3});

U<C, List<String>, int> t0Func<X extends B0, Y extends B1>(
        V0<A, List, num> x0, V1<A, List, num> x1,
        {V2<A, List, num>? x2, V3<A, List, num>? x3, V4<A, List, num>? x4}) =>
    new U<C, List<String>, int>();
U<A, List, int> t1Func<X extends B0, Y extends B0>(
        S0<C, List<String>, int> y0, S1<C, List<String>, int> y1,
        {S2<C, List<String>, int>? x2, S3<C, List<String>, int>? x3}) =>
    new U<A, List, int>();

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;

const t1Default = t1Func;

//# @T0 = T0
//# @T1 = T1
//# @GenericFunctionType
