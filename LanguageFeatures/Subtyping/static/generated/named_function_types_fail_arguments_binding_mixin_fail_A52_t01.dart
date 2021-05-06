// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
/// Named Function Types: T0 is U0 Function<X0 extends B00, ..., Xk extends B0k>
///   (T0 x0, ..., Tn xn, {Tn+1 xn+1, ..., Tm xm})
///
/// and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ..., Sn yn,
/// {Sn+1 yn+1, ..., Sq yq})
/// and {yn+1, ... , yq} subsetof {xn+1, ... , xm}
/// and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...n
/// and Si[Z0/Y0, ..., Zk/Yk] <: Tj[Z0/X0, ..., Zk/Xk] for i in n+1...q, yj = xi
/// and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
/// and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
/// where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
/// @description Check that if  B0i[Z0/X0, ..., Zk/Xk] !== B1i[Z0/Y0, ..., Zk/Yk]
/// for any i in 0...k, then T0 is not a subtype of T1. Test generic types
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as an argument of type T1. Test mixin members. Super method required
/// argument is tested.
/// @compile-error
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from named_function_types_fail_A52.dart and 
/// arguments_binding_mixin_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.





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
    {V2<A, List, num> x2, V3<A, List, num> x3, V4<A, List, num> x4});
typedef T1 = U<A, List, int> Function<X extends B0, Y extends B0>(  //Y extends B0, not B1
    S0<C, List<String>, int> y0, S1<C, List<String>, int> y1,
    {S2<C, List<String>, int> x2, S3<C, List<String>, int> x3});

U<C, List<String>, int> t0Func<X extends B0, Y extends B1>(
        V0<A, List, num> x0, V1<A, List, num> x1,
        {V2<A, List, num> x2, V3<A, List, num> x3, V4<A, List, num> x4}) =>
    null;
U<A, List, int> t1Func<X extends B0, Y extends B0>(
        S0<C, List<String>, int> y0, S1<C, List<String>, int> y1,
        {S2<C, List<String>, int> x2, S3<C, List<String>, int> x3}) =>
    null;

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;




class ArgumentsBindingSuper1_t03 {
  void superTest(T1 val) {}
  void superTestPositioned(T1 val, [T1 val2]) {}
  void superTestNamed(T1 val, {T1 val2}) {}
  T1 get superGetter => t0Instance; //# 07: compile-time error
  void set superSetter(T1 val) {}
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingSuper1_t03 {

  test() {
    superTest(t0Instance); //# 08: compile-time error

    this.superTest(t0Instance); //# 09: compile-time error

    super.superTest(t0Instance); //# 10: compile-time error

    superTestPositioned(t0Instance); //# 11: compile-time error

    this.superTestPositioned(t0Instance); //# 12: compile-time error

    super.superTestPositioned(t0Instance); //# 13: compile-time error

    superTestPositioned(t1Instance, t0Instance); //# 14: compile-time error

    this.superTestPositioned(t1Instance, t0Instance); //# 15: compile-time error

    super.superTestPositioned(t1Instance, t0Instance); //# 16: compile-time error

    superTestNamed(t0Instance); //# 17: compile-time error

    this.superTestNamed(t0Instance); //# 18: compile-time error

    super.superTestNamed(t0Instance); //# 19: compile-time error

    superTestNamed(t1Instance, val2: t0Instance); //# 20: compile-time error

    this.superTestNamed(t1Instance, val2: t0Instance); //# 21: compile-time error

    super.superTestNamed(t1Instance, val2: t0Instance); //# 22: compile-time error

    superSetter = t0Instance; //# 23: compile-time error

    this.superSetter = t0Instance; //# 24: compile-time error

    super.superSetter = t0Instance; //# 25: compile-time error

    superGetter; //# 07: compile-time error

    this.superGetter; //# 07: compile-time error

    super.superGetter; //# 07: compile-time error
  }
}

main() {
  new ArgumentsBinding1_t03().superTest(t0Instance); //# 01: compile-time error
  new ArgumentsBinding1_t03().superTestPositioned(t0Instance); //# 02: compile-time error
  new ArgumentsBinding1_t03().superTestPositioned(t1Instance, t0Instance); //# 03: compile-time error
  new ArgumentsBinding1_t03().superTestNamed(t0Instance); //# 04: compile-time error
  new ArgumentsBinding1_t03().superTestNamed(t1Instance, val2: t0Instance); //# 05: compile-time error
  new ArgumentsBinding1_t03().superSetter = t0Instance; //# 06: compile-time error
  new ArgumentsBinding1_t03().superGetter; //# 07: compile-time error
  new ArgumentsBinding1_t03().test();
}

