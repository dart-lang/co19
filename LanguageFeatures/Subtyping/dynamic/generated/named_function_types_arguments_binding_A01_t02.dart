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
/// and {yn+1, ... , yq} subset of {xn+1, ... , xm}
/// and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...n
/// and Si[Z0/Y0, ..., Zk/Yk] <: Tj[Z0/X0, ..., Zk/Xk] for i in n+1...q, yj = xi
/// and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
/// and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
/// where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
/// @description Check that if T0 and T1 satisfies the rules above, then T0 is
/// subtype of T1
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1. Test superclass members
/// @author sgrekhov@unipro.ru
///
/// This test is generated from named_function_types_A01.dart and 
/// arguments_binding_x02.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


// @dart = 2.9

import '../../utils/common.dart';


class U0 extends U1 {}
class U1 {}
class V0 {}
class V1 {}
class V2 {}
class V3 {}
class V4 {}
class S0 extends V0 {}
class S1 extends V1 {}
class S2 extends V2 {}
class S3 extends V3 {}

typedef T0 = U0 Function(V0 x0, V1 x1, {V2 x2, V3 x3, V4 x4});
typedef T1 = U1 Function(S0 y0, S1 y1, {S2 x2, S3 x3});

U0 t0Func(V0 x0, V1 x1, {V2 x2, V3 x3, V4 x4}) => null;
U1 t1Func(S0 y0, S1 y1, {S2 x2, S3 x3}) => null;

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;

// @dart = 2.9



class ArgumentsBindingSuper1_t02 {
  T1 m;

  ArgumentsBindingSuper1_t02(T1 value) {}
  ArgumentsBindingSuper1_t02.named(T1 value, {T1 val2}) {}
  ArgumentsBindingSuper1_t02.positional(T1 value, [T1 val2]) {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(T1 val) {}
  void superTestPositioned(T1 val, [T1 val2]) {}
  void superTestNamed(T1 val, {T1 val2}) {}
  T1 get superGetter => m;
  void set superSetter(T1 val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(dynamic t1) : super(t1) {}
  ArgumentsBinding1_t02.c1(dynamic t1) : super.named(t1) {}
  ArgumentsBinding1_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding1_t02.c3(dynamic t1) : super.positional(t1) {}
  ArgumentsBinding1_t02.c4(dynamic t1, dynamic t2) : super.positional(t1, t2) {}
  ArgumentsBinding1_t02.c5(dynamic t1) : super.short(t1) {}

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

class ArgumentsBindingSuper2_t02<X> {
  X m;

  ArgumentsBindingSuper2_t02(X value) {}
  ArgumentsBindingSuper2_t02.named(X value, {X val2}) {}
  ArgumentsBindingSuper2_t02.positional(X value, [X val2]) {}
  ArgumentsBindingSuper2_t02.short(this.m);

  void superTest(X val) {}
  void superTestPositioned(X val, [X val2]) {}
  void superTestNamed(X val, {X val2}) {}
  X get superGetter => m;
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t02<X> extends ArgumentsBindingSuper2_t02<X> {
  ArgumentsBinding2_t02(X t1) : super(t1) {}
  ArgumentsBinding2_t02.c1(dynamic t1) : super.named(t1) {}
  ArgumentsBinding2_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding2_t02.c3(dynamic t1) : super.positional(t1) {}
  ArgumentsBinding2_t02.c4(dynamic t1, dynamic t2) : super.positional(t1, t2) {}
  ArgumentsBinding2_t02.c5(dynamic t1) : super.short(t1) {}

  test(X t1, X t2) {
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

main() {
  ArgumentsBinding1_t02 c1 = new ArgumentsBinding1_t02(forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c1(forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c2(t1Instance, forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c3(forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c4(t1Instance, forgetType(t0Instance));
  c1 = new ArgumentsBinding1_t02.c5(forgetType(t0Instance));

  c1.test(forgetType(t0Instance), t1Instance);
  c1.superTest(forgetType(t0Instance));
  c1.superTestPositioned(forgetType(t0Instance));
  c1.superTestPositioned(t1Instance, forgetType(t0Instance));
  c1.superTestNamed(forgetType(t0Instance));
  c1.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c1.superSetter = forgetType(t0Instance);
  c1.superGetter;

  // Test type parameters

    ArgumentsBinding2_t02<T1> c2 =
    new ArgumentsBinding2_t02<T1>(forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<T1>.c1(forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<T1>.c2(t1Instance, forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<T1>.c3(forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<T1>.c4(t1Instance, forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<T1>.c5(forgetType(t0Instance));

  c2.test(forgetType(t0Instance), t1Instance);
  c2.superTest(forgetType(t0Instance));
  c2.superTestPositioned(forgetType(t0Instance));
  c2.superTestPositioned(t1Instance, forgetType(t0Instance));
  c2.superTestNamed(forgetType(t0Instance));
  c2.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c2.superSetter = forgetType(t0Instance);
  c2.superGetter;
  }
