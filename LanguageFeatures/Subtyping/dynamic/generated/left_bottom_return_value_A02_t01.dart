/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Bottom: T0 is Null.
 * @description Check that if type T0 is Null and T1 is dynamic then T0 is a
 * subtype of a type T1.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as a return value of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_bottom_A02.dart and 
 * return_value_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';

class T1 {}

Null t0Instance = null;
dynamic t1Instance = new T1();




dynamic returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static dynamic staticTestMethod() => forgetType(t0Instance);

  dynamic testMethod() => forgetType(t0Instance);

  dynamic get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}


main() {
  dynamic returnValueLocalFunc() => forgetType(t0Instance);

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

  // Test type parameters

    new ReturnValueGen<dynamic>().testMethod();
  new ReturnValueGen<dynamic>().testGetter;
  }
