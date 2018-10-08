/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Interface Compositionality: T0 is an interface type
 * C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and each Si <: Ui
 * @description Check that if type T0 is an interface type
 * C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and not all of Si <: Ui then T0 is
 * not a subtype of T1
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
 * This test is generated from interface_compositionality_fail_A01.dart and 
 * arguments_binding_super_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



abstract class U0 {}
abstract class U1 {}
abstract class U2 {}

abstract class S0 extends U0 {}
abstract class S1 extends U1 {}
// no subtype relation between S2 and U2
abstract class S2 {}

class C0<X, Y, Z> {}

C0<S0, S1, S2> t0Instance = new C0<S0, S1, S2>();
C0<U0, U1, U2> t1Instance = new C0<U0, U1, U2>();




class ArgumentsBindingSuper1_t02 {
  C0<U0, U1, U2> m;

  ArgumentsBindingSuper1_t02(C0<U0, U1, U2> value) {}
  ArgumentsBindingSuper1_t02.named(C0<U0, U1, U2> value, {C0<U0, U1, U2> val2}) {}
  ArgumentsBindingSuper1_t02.positional(C0<U0, U1, U2> value, [C0<U0, U1, U2> val2]) {}
  ArgumentsBindingSuper1_t02.short(this.m);

  void superTest(C0<U0, U1, U2> val) {}
  void superTestPositioned(C0<U0, U1, U2> val, [C0<U0, U1, U2> val2]) {}
  void superTestNamed(C0<U0, U1, U2> val, {C0<U0, U1, U2> val2}) {}
  C0<U0, U1, U2> get superGetter => t0Instance; //# 35: compile-time error
  void set superSetter(C0<U0, U1, U2> val) {}
}

class ArgumentsBinding1_t02 extends ArgumentsBindingSuper1_t02 {
  ArgumentsBinding1_t02(C0<S0, S1, S2> t1) : super(t1) {} //# 01: compile-time error
  ArgumentsBinding1_t02.c1(C0<S0, S1, S2> t1) : super.named(t1) {} //# 02: compile-time error
  ArgumentsBinding1_t02.c2(C0<U0, U1, U2> t1, C0<S0, S1, S2> t2) : super.named(t1, val2: t2) {} //# 03: compile-time error
  ArgumentsBinding1_t02.c3(C0<S0, S1, S2> t1) : super.positional(t1) {} //# 04: compile-time error
  ArgumentsBinding1_t02.c4(C0<U0, U1, U2> t1, C0<S0, S1, S2> t2) : super.positional(t1, t2) {} //# 05: compile-time error
  ArgumentsBinding1_t02.c5(C0<U0, U1, U2> t1) : super.short(t1) {} //# 06: compile-time error

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
