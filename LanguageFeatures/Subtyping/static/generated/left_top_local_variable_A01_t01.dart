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
 * of T0 can be be assigned to the to local variable of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_top_A01.dart and 
 * local_variable_x01.dart.
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




class LocalVariableTest {

  LocalVariableTest() {
    Object? t1 = t0Instance;
    t1 = t0Instance;
  }

  static staticTest() {
    Object? t1 = t0Instance;
    t1 = t0Instance;
  }

  test() {
    Object? t1 = t0Instance;
    t1 = t0Instance;
  }
}

main() {
  foo() {
    Object? t1 = t0Instance;
    t1 = t0Instance;
  }

  Object? t1 = t0Instance;
  t1 = t0Instance;
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
