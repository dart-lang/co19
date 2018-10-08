/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as a return value of type T1
 * @author sgrekhov@unipro.ru
 */

@T1 returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static @T1 staticTestMethod() => forgetType(t0Instance);

  @T1 testMethod() => forgetType(t0Instance);

  @T1 get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}


main() {
  @T1 returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  // Test type parameters

  //# <-- NotGenericFunctionType
  new ReturnValueGen<@T1>().testMethod();
  new ReturnValueGen<@T1>().testGetter;
  //# -->
}
