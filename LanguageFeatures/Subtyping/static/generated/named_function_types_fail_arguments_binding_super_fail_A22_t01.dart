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
 * be used as an argument of type T1. Test superclass members. Super constructor
 * required argument is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from named_function_types_fail_A22.dart and 
 * arguments_binding_super_fail_x01.dart.
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

class X0<X, Y, Z> extends B0<X, Y, Z> {}

class X1<X, Y, Z> extends B1<X, Y, Z> {}

class Y0<X, Y, Z> extends B0<X, Y, Z> {}

class Y1<X, Y, Z> extends B1<X, Y, Z> {}

typedef T0 = U0<C, List<String>, int> Function<X extends B0, Y extends B1>(
    V0<A, List, double> x0, V1<A, List, num> x1,     // S0<C, List<String>, int> is not subtype of V0<A, List, double>
    {V2<A, List, num>? x2, V3<A, List, num>? x3, V4<A, List, num>? x4});
typedef T1 = U1<A, List, num> Function<X extends B0, Y extends B1>(
    S0<C, List<String>, int> y0, S1<C, List<String>, int> y1,
    {S2<C, List<String>, int>? x2, S3<C, List<String>, int>? x3});

U0<C, List<String>, int> t0Func<X extends B0, Y extends B1>(
        V0<A, List, double> x0, V1<A, List, num> x1,
        {V2<A, List, num>? x2, V3<A, List, num>? x3, V4<A, List, num>? x4}) =>
    new U0<C, List<String>, int>();
U1<A, List, num> t1Func<X extends B0, Y extends B1>(
        S0<C, List<String>, int> y0, S1<C, List<String>, int> y1,
        {S2<C, List<String>, int>? x2, S3<C, List<String>, int>? x3}) =>
    new U1<A, List, num>();

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;

const t1Default = t1Func;




class ArgumentsBindingSuper1_t02 {
  T1 m;

  ArgumentsBindingSuper1_t02(T1 value): m = value {}
  ArgumentsBindingSuper1_t02.named(T1 value, {T1 val2 = t1Default}): m = value {}
  ArgumentsBindingSuper1_t02.positional(T1 value, [T1 val2 = t1Default]): m = value {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(T1 val) {}
  void superTestPositioned(T1 val, [T1 val2 = t1Default]) {}
  void superTestNamed(T1 val, {T1 val2 = t1Default}) {}
  T1 get superGetter => t0Instance;
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set superSetter(T1 val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(T0 t0) : super(t0) {}
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c1(T0 t0) : super.named(t0) {}
//                                               ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c2(T1 t1, T0 t2) : super.named(t1, val2: t2) {}
//                                                       ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c3(T0 t0) : super.positional(t0) {}
//                                                    ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c4(T1 t1, T0 t2) : super.positional(t1, t2) {}
//                                                                ^^
// [analyzer] unspecified
// [cfe] unspecified
  ArgumentsBinding1_t02.c5(T0 t1) : super.short(t1) {}
//                                               ^^
// [analyzer] unspecified
// [cfe] unspecified

  ArgumentsBinding1_t02.valid() : super(t1Default) {}

  test() {
    superTest(t0Instance);
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTest(t0Instance);
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTest(t0Instance);
//                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestPositioned(t0Instance);
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestPositioned(t0Instance);
//                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestPositioned(t0Instance);
//                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestPositioned(t1Instance, t0Instance);
//                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestPositioned(t1Instance, t0Instance);
//                                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestPositioned(t1Instance, t0Instance);
//                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestNamed(t0Instance);
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestNamed(t0Instance);
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestNamed(t0Instance);
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestNamed(t1Instance, val2: t0Instance);
//                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestNamed(t1Instance, val2: t0Instance);
//                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestNamed(t1Instance, val2: t0Instance);
//                                         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superSetter = t0Instance;
//                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superSetter = t0Instance;
//                     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superSetter = t0Instance;
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new ArgumentsBinding1_t02.valid().superTest(t0Instance);
//                                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superTestPositioned(t0Instance);
//                                                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superTestPositioned(t1Instance, t0Instance);
//                                                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superTestNamed(t0Instance);
//                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superTestNamed(t1Instance, val2: t0Instance);
//                                                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().superSetter = t0Instance;
//                                                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t02.valid().test();
}

