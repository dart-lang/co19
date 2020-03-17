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
 * @description Check that if there is i in n+1...q such that
 * Si[Z0/Y0, ..., Zk/Yk] is not subtype of Tj[Z0/X0, ..., Zk/Xk], then T0 is not
 * a subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test superclass members
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from named_function_types_fail_A31.dart and 
 * arguments_binding_fail_x02.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';
// SharedOptions=--enable-experiment=non-nullable
class U0 extends U1 {}
class U1 {}
class V0 {}
class V1 {}
class V2 {}
class V3 {}
class V4 {}
class S0 extends V0 {}
class S1 extends V1 {}
class S2 {}
class S3 extends V3 {}

typedef T0 = U0 Function(V0 x0, V1 x1, {V2? x2, V3? x3, V4? x4});
typedef T1 = U1 Function(S0 y0, S1 y1, {S2? x2, S3? x3}); // S2 is not subtype of V1

U0 t0Func(V0 x0, V1 x1, {V2? x2, V3? x3, V4? x4}) => new U0();
U1 t1Func(S0 y0, S1 y1, {S2? x2, S3? x3}) => new U1();

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
  T1 get superGetter => forgetType(t0Instance);
  void set superSetter(T1 val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(dynamic t1) : super(t1) {}
  ArgumentsBinding1_t02.c1(dynamic t1) : super.named(t1) {}
  ArgumentsBinding1_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding1_t02.c3(dynamic t1) : super.positional(t1) {}
  ArgumentsBinding1_t02.c4(dynamic t1, dynamic t2) : super.positional(t1, t2) {}
  ArgumentsBinding1_t02.c5(dynamic t1) : super.short(t1) {}

  test() {
    Expect.throws(() {
      superTest(forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      this.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      super.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      this.superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      super.superTestPositioned(forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      this.superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      super.superTestPositioned(forgetType(t1Instance), forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      super.superTestNamed(forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      super.superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      this.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      super.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      superGetter;
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      this.superGetter;
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      super.superGetter;
    }, (e) => e is TypeError || e is CastError);
  }
}

class ArgumentsBindingSuper2_t02<X> {
  X m;

  ArgumentsBindingSuper2_t02(X value): m = value {}
  ArgumentsBindingSuper2_t02.named(X value, {required X val2}): m = value {}
  ArgumentsBindingSuper2_t02.short(this.m);

  void superTest(X val) {}
  void superTestNamed(X val, {required X val2}) {}
  X get superGetter => forgetType(t0Instance);
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t02<X> extends ArgumentsBindingSuper2_t02<X> {
  ArgumentsBinding2_t02(dynamic t1) : super(t1) {}
  ArgumentsBinding2_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding2_t02.c5(dynamic t1) : super.short(t1) {}

  test() {
    Expect.throws(() {
      superTest(forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      this.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      super.superTest(forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      this.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      super.superSetter = forgetType(t0Instance);
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      superGetter;
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      this.superGetter;
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      super.superGetter;
    }, (e) => e is TypeError || e is CastError);
  }
}

main() {
  // test constructors
  Expect.throws(() {
    new ArgumentsBinding1_t02(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c1(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c2(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c3(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c4(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t02.c5(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  // test class members
  Expect.throws(() {
    new ArgumentsBinding1_t02(t1Instance).superTest(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t02(t1Instance).superTestPositioned(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t02(t1Instance).superTestPositioned(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t02(t1Instance).superTestNamed(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t02(t1Instance).superTestNamed(t1Instance, val2: forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t02(t1Instance).superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t02(t1Instance).superGetter;
  }, (e) => e is TypeError || e is CastError);

  new ArgumentsBinding1_t02(t1Instance).test();

  // Test type parameters

  //# <-- NotGenericFunctionType
  // test generic class constructors
  Expect.throws(() {
    new ArgumentsBinding2_t02<T1>(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1>.c2(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1>.c5(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  // test generic class members
  Expect.throws(() {
    new ArgumentsBinding2_t02<T1>(t1Instance).superTest(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1>(t1Instance).superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1>(t1Instance).superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding2_t02<T1>(t1Instance).superGetter;
  }, (e) => e is TypeError || e is CastError);

  new ArgumentsBinding2_t02<T1>(t1Instance).test();
  //# -->
}
