/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
 * Positional Function Types: T0 is U0 Function<X0 extends B00, ... ,
 * Xk extends B0k>(V0 x0, ..., Vn xn, [Vn+1 xn+1, ..., Vm xm])
 *
 *  and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ...,
 *  Sp yp, [Sp+1 yp+1, ..., Sq yq])
 *  and p >= n
 *  and m >= q
 *  and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...q
 *  and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
 *  and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
 *  where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
 * @description Check that if T0 and T1 satisfies the rules above, then T0 is
 * subtype of T1. Test generic types with high-level types and the case when
 * p > n and m > q.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the mixin member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from positional_function_types_A22.dart and 
 * class_member_x03.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
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

class S4<X, Y, Z> extends V4<X, Y, Z> {}

class X0<X, Y, Z> extends B0<X, Y, Z> {}

class X1<X, Y, Z> extends B1<X, Y, Z> {}

class Y0<X, Y, Z> extends B0<X, Y, Z> {}

class Y1<X, Y, Z> extends B1<X, Y, Z> {}

typedef T0 = U0<C, List<String>, int> Function<X extends B0, Y extends B1>(
    V0<dynamic, void, Object> x0, V1<void, Object, dynamic> x1,
    [V2<Object, dynamic, void>? x2, V3<dynamic, Object, void>? x3, V4<dynamic,
    void, Object>? x4]);

typedef T1 = U1<dynamic, void, Object> Function<X extends B0, Y extends B1>(
    S0<C, List<String>, int> y0, S1<C, List<String>, int> y1,
    S2<C, List<String>, int> x2, [S3<C, List<String>, int>? x3]);

U0<C, List<String>, int> t0Func<X extends B0, Y extends B1>(
    V0<dynamic, void, Object> x0, V1<void, Object, dynamic> x1,
    [V2<Object,dynamic, void>? x2, V3<dynamic, Object, void>? x3, V4<dynamic,
    void, Object>? x4]) => new U0<C, List<String>, int>();

U1<dynamic, void, Object> t1Func<X extends B0, Y extends B1>(
    S0<C, List<String>, int> y0, S1<C, List<String>, int> y1,
    S2<C, List<String>, int> x2, [S3<C, List<String>, int>? x3]) =>
    new U1<dynamic, void, Object>();

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;
const t1Default = t1Func;



class ClassMemberMixin1_t03 {
  T1 m = t1Default;

  void set superSetter(dynamic val) {}
}

class ClassMember1_t03 extends Object with ClassMemberMixin1_t03 {
  test() {
    m = t0Instance;
    superSetter = t0Instance;
  }
}

main() {
  ClassMember1_t03 c1 = new ClassMember1_t03();
  c1.m = t0Instance;
  c1.test();
  c1.superSetter = t0Instance;
}

