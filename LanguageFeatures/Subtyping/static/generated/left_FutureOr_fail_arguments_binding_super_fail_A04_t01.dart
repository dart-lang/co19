// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left FutureOr: T0 is FutureOr<S0>
///   and Future<S0> <: T1
///   and S0 <: T1
/// @description Check that if a type T0 is FutureOr<S0> and S0 is a subtype of
/// T1 but Future<S0> is not a subtype of T1 , then a type T0 is not a subtype of
/// a type T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as an argument of type T1. Test superclass members. Super constructor
/// required argument is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from left_FutureOr_fail_A04.dart and 
/// arguments_binding_super_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.



import "dart:async";

FutureOr? t0Instance = Future.value(42);
Future? t1Instance = Future.value(42);

const t1Default = null;




class ArgumentsBindingSuper1_t02 {
  Future? m = t1Default;

  ArgumentsBindingSuper1_t02(Future? value): m = value {}
  ArgumentsBindingSuper1_t02.named(Future? value, {Future? val2 = t1Default}): m = value {}
  ArgumentsBindingSuper1_t02.positional(Future? value, [Future? val2 = t1Default]): m = value {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(Future? val) {}
  void superTestPositioned(Future? val, [Future? val2 = t1Default]) {}
  void superTestNamed(Future? val, {Future? val2 = t1Default}) {}
  Future? get superGetter => t0Instance;
  void set superSetter(Future? val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(FutureOr? t0) : super(t0) {}
  ArgumentsBinding1_t02.c1(FutureOr? t0) : super.named(t0) {}
  ArgumentsBinding1_t02.c2(Future? t1, FutureOr? t2) : super.named(t1, val2: t2) {}
  ArgumentsBinding1_t02.c3(FutureOr? t0) : super.positional(t0) {}
  ArgumentsBinding1_t02.c4(Future? t1, FutureOr? t2) : super.positional(t1, t2) {}
  ArgumentsBinding1_t02.c5(FutureOr? t1) : super.short(t1) {}

  ArgumentsBinding1_t02.valid() : super(t1Default) {}

  test() {
    superTest(t0Instance);

    this.superTest(t0Instance);

    super.superTest(t0Instance);

    superTestPositioned(t0Instance);

    this.superTestPositioned(t0Instance);

    super.superTestPositioned(t0Instance);

    superTestPositioned(t1Instance, t0Instance);

    this.superTestPositioned(t1Instance, t0Instance);

    super.superTestPositioned(t1Instance, t0Instance);

    superTestNamed(t0Instance);

    this.superTestNamed(t0Instance);

    super.superTestNamed(t0Instance);

    superTestNamed(t1Instance, val2: t0Instance);

    this.superTestNamed(t1Instance, val2: t0Instance);

    super.superTestNamed(t1Instance, val2: t0Instance);

    superSetter = t0Instance;

    this.superSetter = t0Instance;

    super.superSetter = t0Instance;
  }
}

main() {
  new ArgumentsBinding1_t02.valid().superTest(t0Instance);
  new ArgumentsBinding1_t02.valid().superTestPositioned(t0Instance);
  new ArgumentsBinding1_t02.valid().superTestPositioned(t1Instance, t0Instance);
  new ArgumentsBinding1_t02.valid().superTestNamed(t0Instance);
  new ArgumentsBinding1_t02.valid().superTestNamed(t1Instance, val2: t0Instance);
  new ArgumentsBinding1_t02.valid().superSetter = t0Instance;
  new ArgumentsBinding1_t02.valid().test();
}
