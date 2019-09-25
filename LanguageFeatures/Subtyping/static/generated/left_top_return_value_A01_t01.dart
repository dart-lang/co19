/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Top: if T0 is dynamic or void then T0 <: T1 if Object? <: T1
 * @description Check that if type T0 is dynamic and Object? <: T1 then T0 is a
 * subtype of a type T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as a return value of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_top_A01.dart and 
 * return_value_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable

class T1 {
  const T1();
}

dynamic t0Instance = "Show must go on";
T1? t1Instance = new T1();

const t1Default = const T1();




Object? returnValueFunc() => t0Instance;

class ReturnValueTest {
  static Object? staticTestMethod() => t0Instance;

  Object? testMethod() => t0Instance;

  Object? get testGetter => t0Instance;
}

main() {
  Object? returnValueLocalFunc() => t0Instance;

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

}
