/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Legacy if T0 is S0* then:
 * - T0 <: T1 iff S0 <: T1.
 * @description Check that if type T0 is S0* and S0 <: T1 then T0 is subtype of
 * T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then instance
 * of T0 cannot be be used as a return value of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_legacy_fail_A02.dart and 
 * return_value_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../utils/legacy_lib.dart";

class A extends X {
  const A();
}

X t0Instance = new X();
A t1Instance = new A();

const t1Default = const A();




A returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static A staticTestMethod() => forgetType(t0Instance);

  A testMethod() => forgetType(t0Instance);

  A get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}

main() {
  A returnValueLocalFunc() => forgetType(t0Instance);

  Expect.throws(() {
    returnValueFunc();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    returnValueLocalFunc();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    ReturnValueTest.staticTestMethod();
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new ReturnValueTest().testMethod();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ReturnValueTest().testGetter;
  }, (e) => e is TypeError || e is CastError);

  // Test type parameters

  //# <-- NotGenericFunctionType
  Expect.throws(() {
    new ReturnValueGen<A>().testMethod();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ReturnValueGen<A>().testGetter;
  }, (e) => e is TypeError || e is CastError);
  //# -->
}
