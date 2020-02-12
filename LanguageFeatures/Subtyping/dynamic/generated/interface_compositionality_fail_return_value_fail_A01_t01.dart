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
 * @description Check that if type T0 not a subtype of a type T1, then instance
 * of T0 cannot be be used as a return value of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from interface_compositionality_fail_A01.dart and 
 * return_value_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';
// SharedOptions=--enable-experiment=non-nullable
abstract class U0 {}
abstract class U1 {}
abstract class U2 {}

abstract class S0 extends U0 {}
abstract class S1 extends U1 {}
// no subtype relation between S2 and U2
abstract class S2 {}

class C0<X, Y, Z> {
  const C0();
}

C0<S0, S1, S2> t0Instance = new C0<S0, S1, S2>();
C0<U0, U1, U2> t1Instance = new C0<U0, U1, U2>();

const t1Default = const C0<U0, U1, U2>();




C0<U0, U1, U2> returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static C0<U0, U1, U2> staticTestMethod() => forgetType(t0Instance);

  C0<U0, U1, U2> testMethod() => forgetType(t0Instance);

  C0<U0, U1, U2> get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}

main() {
  C0<U0, U1, U2> returnValueLocalFunc() => forgetType(t0Instance);

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
    new ReturnValueGen<C0<U0, U1, U2>>().testMethod();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ReturnValueGen<C0<U0, U1, U2>>().testGetter;
  }, (e) => e is TypeError || e is CastError);
  //# -->
}
