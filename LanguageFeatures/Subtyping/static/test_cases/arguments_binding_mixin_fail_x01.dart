/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test mixin members. Super method required
 * argument is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ArgumentsBindingSuper1_t03 {
  void superTest(@T1 val) {}
  void superTestPositioned(@T1 val, [@T1 val2]) {}
  void superTestNamed(@T1 val, {@T1 val2}) {}
  @T1 get superGetter => t0Instance; //# 07: compile-time error
  void set superSetter(@T1 val) {}
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
