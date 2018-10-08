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
 * @description Check that if {yn+1, ... , yq} is not subsetof {xn+1, ... , xm},
 * then T0 is not a subtype of T1
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
 * This test is generated from named_function_types_fail_A12.dart and 
 * arguments_binding_super_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



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
class S4 extends V4 {}

class X0 extends B0 {}
class X1 extends B1 {}

class Y0 extends B0 {}
class Y1 extends B1 {}

typedef T0 = U0 Function<X extends B0, Y extends B1>(V0 x0, V1 x1, {V2 x2, V3 x3, V4 x4});
typedef T1 = U1 Function<X extends B0, Y extends B1>(S0 y0, S1 y1, {S2 x2, S3 x3, S4 x4, V4 x5}); // x2...x5 is not subset of x2...x4

U0 t0Func<X extends B0, Y extends B1>(V0 x0, V1 x1, {V2 x2, V3 x3, V4 x4}) => null;
U1 t1Func<X extends B0, Y extends B1>(S0 y0, S1 y1, {S2 x2, S3 x3, S4 x4, V4 x5}) => null;

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;



class ArgumentsBindingSuper1_t02 {
  T1 m;

  ArgumentsBindingSuper1_t02(T1 value) {}
  ArgumentsBindingSuper1_t02.named(T1 value, {T1 val2}) {}
  ArgumentsBindingSuper1_t02.positional(T1 value, [T1 val2]) {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(T1 val) {}
  void superTestPositioned(T1 val, [T1 val2]) {}
  void superTestNamed(T1 val, {T1 val2}) {}
  T1 get superGetter => t0Instance; //# 35: compile-time error
  void set superSetter(T1 val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(T0 t1) : super(t1) {} //# 01: compile-time error
  ArgumentsBinding1_t02.c1(T0 t1) : super.named(t1) {} //# 02: compile-time error
  ArgumentsBinding1_t02.c2(T1 t1, T0 t2) : super.named(t1, val2: t2) {} //# 03: compile-time error
  ArgumentsBinding1_t02.c3(T0 t1) : super.positional(t1) {} //# 04: compile-time error
  ArgumentsBinding1_t02.c4(T1 t1, T0 t2) : super.positional(t1, t2) {} //# 05: compile-time error
  ArgumentsBinding1_t02.c5(T1 t1) : super.short(t1) {} //# 06: compile-time error

  ArgumentsBinding1_t02.valid() : super(null) {}

  test() {
    superTest(t0Instance); //# 14: compile-time error

    this.superTest(t0Instance); //# 15: compile-time error

    super.superTest(t0Instance); //# 16: compile-time error

    superTestPositioned(t0Instance); //# 17: compile-time error

    this.superTestPositioned(t0Instance); //# 18: compile-time error

    super.superTestPositioned(t0Instance); //# 19: compile-time error

    superTestPositioned(t1Instance, t0Instance); //# 20: compile-time error

    this.superTestPositioned(t1Instance, t0Instance); //# 21: compile-time error

    super.superTestPositioned(t1Instance, t0Instance); //# 22: compile-time error

    superTestNamed(t0Instance); //# 23: compile-time error

    this.superTestNamed(t0Instance); //# 24: compile-time error

    super.superTestNamed(t0Instance); //# 25: compile-time error

    superTestNamed(t1Instance, val2: t0Instance); //# 26: compile-time error

    this.superTestNamed(t1Instance, val2: t0Instance); //# 27: compile-time error

    super.superTestNamed(t1Instance, val2: t0Instance); //# 28: compile-time error

    superSetter = t0Instance; //# 29: compile-time error

    this.superSetter = t0Instance; //# 30: compile-time error

    super.superSetter = t0Instance; //# 31: compile-time error

    superGetter; //# 32: compile-time error

    this.superGetter; //# 33: compile-time error

    super.superGetter; //# 34: compile-time error
  }
}

main() {
  new ArgumentsBinding1_t02(t0Instance); //# 01: compile-time error
  new ArgumentsBinding1_t02.c1(t0Instance); //# 02: compile-time error
  new ArgumentsBinding1_t02.c2(t1Instance, t0Instance); //# 03: compile-time error
  new ArgumentsBinding1_t02.c3(t0Instance); //# 04: compile-time error
  new ArgumentsBinding1_t02.c4(t1Instance, t0Instance);//# 05: compile-time error
  new ArgumentsBinding1_t02.c5(t0Instance); //# 06: compile-time error
  new ArgumentsBinding1_t02.valid().superTest(t0Instance); //# 07: compile-time error
  new ArgumentsBinding1_t02.valid().superTestPositioned(t0Instance); //# 08: compile-time error
  new ArgumentsBinding1_t02.valid().superTestPositioned(t1Instance, t0Instance); //# 09: compile-time error
  new ArgumentsBinding1_t02.valid().superTestNamed(t0Instance); //# 10: compile-time error
  new ArgumentsBinding1_t02.valid().superTestNamed(t1Instance, val2: t0Instance); //# 11: compile-time error
  new ArgumentsBinding1_t02.valid().superSetter = t0Instance; //# 12: compile-time error
  new ArgumentsBinding1_t02.valid().superGetter; //# 13: compile-time error
  new ArgumentsBinding1_t02.valid().test();
}

