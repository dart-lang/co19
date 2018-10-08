/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then instance
 * of T0 cannot be be used as a return value of type T1. Return value is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

@T1 returnValueFunc() => t0Instance; //# 01: compile-time error

class ReturnValueTest {
  static @T1 staticTestMethod() => t0Instance; //# 03: compile-time error
  @T1 testMethod() => t0Instance; //# 04: compile-time error
  @T1 get testGetter => t0Instance; //# 05: compile-time error
}

main() {
  returnValueFunc(); //# 01: compile-time error

  @T1 returnValueLocalFunc() => t0Instance; //# 02: compile-time error
  returnValueLocalFunc(); //# 02: compile-time error

  ReturnValueTest.staticTestMethod(); //# 03: compile-time error
  new ReturnValueTest().testMethod(); //# 04: compile-time error
  new ReturnValueTest().testGetter; //# 05: compile-time error
}
