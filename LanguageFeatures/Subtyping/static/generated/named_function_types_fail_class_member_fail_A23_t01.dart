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
 * @description Check that if there is i in 0...n such that
 * Si[Z0/Y0, ..., Zk/Yk] is not subtype of Vi[Z0/X0, ..., Zk/Xk], then T0 is not
 * a subtype of T1. Test generic types
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as a class member of type T1. Assignment to static and instance class
 * variables is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from named_function_types_fail_A23.dart and 
 * class_member_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class A {}

class C extends A {}

class U<X, Y, Z> {}

class B0<X, Y, Z> {}

class B1<X, Y, Z> {}

class V0<X, Y, Z> {}

class V1<X, Y, Z> {}

class V2<X, Y, Z> {}

class V3<X, Y, Z> {}

class V4<X, Y, Z> {}

typedef T0 = U<C, List<String>, int> Function<X extends B0, Y extends B1>(
    V0<A, List, double> x0, V1<A, List, num> x1,     // V0<C, List<String>, int> is not subtype of V0<A, List, double>
    {V2<A, List, num>? x2, V3<A, List, num>? x3, V4<A, List, num>? x4});
typedef T1 = U<A, List, num> Function<X extends B0, Y extends B1>(
    V0<C, List<String>, int> y0, V1<C, List<String>, int> y1,
    {V2<C, List<String>, int>? x2, V3<C, List<String>, int>? x3});

U<C, List<String>, int> t0Func<X extends B0, Y extends B1>(
        V0<A, List, double> x0, V1<A, List, num> x1,
        {V2<A, List, num>? x2, V3<A, List, num>? x3, V4<A, List, num>? x4}) =>
    new U<C, List<String>, int>();
U<A, List, num> t1Func<X extends B0, Y extends B1>(
        V0<C, List<String>, int> y0, V1<C, List<String>, int> y1,
        {V2<C, List<String>, int>? x2, V3<C, List<String>, int>? x3}) =>
    new U<A, List, num>();

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;

const t1Default = t1Func;



class ClassMemberTestStatic {
  static T1 s = t1Default;

  ClassMemberTestStatic(T0 val) {
    s = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static staticTest() {
    s = t0Instance;
//      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static set staticSetter(T0 val) {
    s = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static T1 get staticGetter => t0Instance;
//                               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class ClassMemberTestPublic {
  T1 m = t1Default;

  ClassMemberTestPublic(T0 val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(T0 val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  set setter(T0 val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  T1 get getter => t0Instance;
//                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class ClassMemberTestPrivate {
  T1 _m = t1Default;

  ClassMemberTestPrivate(T0 val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(T0 val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  set setter(T0 val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class ClassMemberTestInitFail {
  static T1 s = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  T1 m = t0Instance;
//        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new ClassMemberTestPublic.validConstructor().m = t0Instance;
//                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

