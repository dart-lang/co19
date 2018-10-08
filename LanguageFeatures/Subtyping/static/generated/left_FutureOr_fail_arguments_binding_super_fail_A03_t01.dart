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
 * @description Check that if a type T0 is FutureOr<S0> and S0 is a subtype of
 * T1 but Future<S0> is not a subtype of T1, then a type T0 is not a subtype of
 * a type T1. Case when an instance of T0 is an instance of Future<S0> type.
 * @author ngl@unipro.ru
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
 * This test is generated from left_FutureOr_fail_A03.dart and 
 * arguments_binding_super_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



import "dart:async";

class C1 {}
class S0 implements Future<C1> {
  asStream() => null;
  catchError(Function onError, {bool test(Object error)}) => null;
  then<S0>(FutureOr<S0> onValue(C1 value), {Function onError}) => null;
  timeout(Duration timeLimit, {FutureOr<C1> onTimeout()}) => null;
  whenComplete(FutureOr action()) => null;
}

// Future<S0> is not a subtype of T1 (Future<C1>)
FutureOr<S0> t0Instance = new Future<S0>.value(new S0());
Future<C1> t1Instance = new Future.value(new C1());




class ArgumentsBindingSuper1_t02 {
  Future<C1> m;

  ArgumentsBindingSuper1_t02(Future<C1> value) {}
  ArgumentsBindingSuper1_t02.named(Future<C1> value, {Future<C1> val2}) {}
  ArgumentsBindingSuper1_t02.positional(Future<C1> value, [Future<C1> val2]) {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(Future<C1> val) {}
  void superTestPositioned(Future<C1> val, [Future<C1> val2]) {}
  void superTestNamed(Future<C1> val, {Future<C1> val2}) {}
  Future<C1> get superGetter => t0Instance; //# 35: compile-time error
  void set superSetter(Future<C1> val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(FutureOr<S0> t1) : super(t1) {} //# 01: compile-time error
  ArgumentsBinding1_t02.c1(FutureOr<S0> t1) : super.named(t1) {} //# 02: compile-time error
  ArgumentsBinding1_t02.c2(Future<C1> t1, FutureOr<S0> t2) : super.named(t1, val2: t2) {} //# 03: compile-time error
  ArgumentsBinding1_t02.c3(FutureOr<S0> t1) : super.positional(t1) {} //# 04: compile-time error
  ArgumentsBinding1_t02.c4(Future<C1> t1, FutureOr<S0> t2) : super.positional(t1, t2) {} //# 05: compile-time error
  ArgumentsBinding1_t02.c5(Future<C1> t1) : super.short(t1) {} //# 06: compile-time error

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
