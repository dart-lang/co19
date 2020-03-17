/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left FutureOr: T0 is FutureOr<S0>
 *   and Future<S0> <: T1
 *   and S0 <: T1
 * @description Check that if a type T0 is FutureOr<S0> and Future<S0> and S0
 * are subtypes of a type T1, then a type T0 is a subtype of a type T1. Case
 * when an instance of T0 is an instance of Future<S0> type and S0 is a generic
 * type
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as an argument of type T1. Test superclass members
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_FutureOr_A04.dart and 
 * arguments_binding_x02.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
// SharedOptions=--enable-experiment=non-nullable
import "dart:async";

class A {}
class B extends A {}
class C<X> {
  const C();
}
class S0<X> extends C<X> {}

FutureOr<S0<B>> t0Instance = new Future<S0<B>>.value(new S0<B>());
FutureOr<C<A>> t1Instance = new Future<C<A>>.value(new C<A>());

const t1Default = const C<A>();




class ArgumentsBindingSuper1_t02 {
  FutureOr<C<A>> m;

  ArgumentsBindingSuper1_t02(FutureOr<C<A>> value): m = value {}
  ArgumentsBindingSuper1_t02.named(FutureOr<C<A>> value, {FutureOr<C<A>> val2 = t1Default}): m = value {}
  ArgumentsBindingSuper1_t02.positional(FutureOr<C<A>> value, [FutureOr<C<A>> val2 = t1Default]): m = value {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(FutureOr<C<A>> val) {}
  void superTestPositioned(FutureOr<C<A>> val, [FutureOr<C<A>> val2 = t1Default]) {}
  void superTestNamed(FutureOr<C<A>> val, {FutureOr<C<A>> val2 = t1Default}) {}
  FutureOr<C<A>> get superGetter => m;
  void set superSetter(FutureOr<C<A>> val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(dynamic t1) : super(t1) {}
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

  ArgumentsBindingSuper2_t02(X value): m = value {}
  ArgumentsBindingSuper2_t02.named(X value, {required X val2}):m = value {}
  ArgumentsBindingSuper2_t02.short(this.m);

  void superTest(X val) {}
  void superTestNamed(X val, {required X val2}) {}
  X get superGetter => m;
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t02<X> extends ArgumentsBindingSuper2_t02<X> {
  ArgumentsBinding2_t02(X t1) : super(t1) {}
  ArgumentsBinding2_t02.c2(dynamic t1, dynamic t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding2_t02.c5(dynamic t1) : super.short(t1) {}

  test(X t1, X t2) {
    superTest(t1);
    superTestNamed(t2, val2: t1);
    superSetter = t1;
    m = t1;
    superGetter;
  }
}

main() {
  ArgumentsBinding1_t02 c1 = new ArgumentsBinding1_t02(forgetType(t0Instance));
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

  //# <-- NotGenericFunctionType
  ArgumentsBinding2_t02<FutureOr<C<A>>> c2 =
    new ArgumentsBinding2_t02<FutureOr<C<A>>>(forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<FutureOr<C<A>>>.c2(t1Instance, forgetType(t0Instance));
  c2 = new ArgumentsBinding2_t02<FutureOr<C<A>>>.c5(forgetType(t0Instance));

  c2.test(forgetType(t0Instance), t1Instance);
  c2.superTest(forgetType(t0Instance));
  c2.superTestNamed(t1Instance, val2: forgetType(t0Instance));
  c2.superSetter = forgetType(t0Instance);
  c2.superGetter;
  //# -->
}
