/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Legacy T1 is S1* then:
 * - T0 <: T1 iff T0 <: S1?
 * @description Check that if type T1 is S1* and T0 is not subtype of S1? then
 * T0 is not subtype of T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as an argument of type T1. Test mixin members
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_legacy_fail_A01.dart and 
 * arguments_binding_fail_x03.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../utils/legacy_lib.dart";

class C extends X {}

C? t0Instance = new C();
Y t1Instance = new Y();

const t1Default = const Y();




class ArgumentsBindingSuper1_t03 {
  void superTest(Y val) {}
  void superTestPositioned(Y val, [Y val2 = t1Default]) {}
  void superTestNamed(Y val, {Y val2 = t1Default}) {}
  Y get superGetter => forgetType(t0Instance);
  void set superSetter(Y val) {}
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingSuper1_t03 {

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

class ArgumentsBindingSuper2_t03<X> {
  void superTest(X val) {}
  void superTestNamed(X val, {required X val2}) {}
  X get superGetter => forgetType(t0Instance);
  void set superSetter(X val) {}
}

class ArgumentsBinding2_t03<X> extends Object with ArgumentsBindingSuper2_t03<X> {

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
      superTestNamed(forgetType(t0Instance), val2: forgetType(t1Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      this.superTestNamed(forgetType(t0Instance), val2: forgetType(t1Instance));
    }, (e) => e is TypeError || e is CastError);

    Expect.throws(() {
      super.superTestNamed(forgetType(t0Instance), val2: forgetType(t1Instance));
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

main() {
  // test class members
  Expect.throws(() {
    new ArgumentsBinding1_t03().superTest(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t03().superTestPositioned(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t03().superTestPositioned(t1Instance, forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t03().superTestNamed(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t03().superTestNamed(t1Instance, val2: forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t03().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding1_t03().superGetter;
  }, (e) => e is TypeError || e is CastError);

  new ArgumentsBinding1_t03().test();

  // Test type parameters

  //# <-- NotGenericFunctionType
  // test generic class members
  Expect.throws(() {
    new ArgumentsBinding2_t03<Y>().superTest(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding2_t03<Y>().superTest(forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding2_t03<Y>().superTestNamed(forgetType(t0Instance), val2: forgetType(t1Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding2_t03<Y>().superTestNamed(forgetType(t1Instance), val2: forgetType(t0Instance));
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding2_t03<Y>().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ArgumentsBinding2_t03<Y>().superGetter;
  }, (e) => e is TypeError || e is CastError);

  new ArgumentsBinding2_t03<Y>().test();
  //# -->
}
