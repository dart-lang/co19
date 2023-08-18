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
/// @description Check that if B0i[Z0/X0, ..., Zk/Xk] !== B1i[Z0/Y0, ..., Zk/Yk]
/// for any i in 0...k, then T0 is not a subtype of T1
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be assigned to the to local variable of type T1.
/// Assignment to local variable is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from test_types/named_function_types_fail_A51.dart and
/// test_cases/local_variable_fail_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

class U0 extends U1 {}

class U1 {}

class B0 {}

class B1 {}

class V0 {}

class V1 {}

class V2 {}

class V3 {}

class V4 {}

class S0 extends V0 {}

class S1 extends V1 {}

class S2 extends V2 {}

class S3 extends V3 {}

class X0 extends B0 {}

class X1 extends B1 {}

class Y0 extends B0 {}

typedef T0 = U0 Function<X extends B0, Y extends B1>(V0 x0, V1 x1,
    {V2? x2, V3? x3, V4? x4});
typedef T1 = U1 Function<X extends B0, Y extends B0>(S0 y0, S1 y1,
    {S2? x2, S3? x3}); //  Y extends B0, not B1

U0 t0Func<X extends B0, Y extends B1>(V0 x0, V1 x1, {V2? x2, V3? x3, V4? x4}) =>
    new U0();
U1 t1Func<X extends B0, Y extends B0>(S0 y0, S1 y1, {S2? x2, S3? x3}) =>
    new U1();

T0 t0Instance = t0Func;

class LocalVariableTest {
  LocalVariableTest() {
    T1 t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  test() {
    T1 t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static staticTest() {
    T1 t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  T1 t1 = t0Instance;
//         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  bar () {
    T1 t1 = t0Instance;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
