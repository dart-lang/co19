/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Promoted Variable: T0 is a promoted type variable X0 & S0
 * and S0 <: T1
 * @description Check that if type T0 is a promoted type variable X0 & S0 and S0
 * is subtype of T1 then T0 is a subtype of T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the to local variable of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_promoted_variable_A02.dart and 
 * local_variable_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class T1 {
  const T1();
}
class X0 {}
class S0 extends X0 implements T1 {}


S0 t0Instance = new S0();
T1 t1Instance = new T1();

const t1Default = const T1();




class LocalVariableTest {

  LocalVariableTest() {
    T1 t1 = t0Instance;
    t1 = t0Instance;
  }

  static staticTest() {
    T1 t1 = t0Instance;
    t1 = t0Instance;
  }

  test() {
    T1 t1 = t0Instance;
    t1 = t0Instance;
  }
}



test<T>(T t0Instance) {
  if (t0Instance is S0) {
  
  foo() {
    T1 t1 = t0Instance;
    t1 = t0Instance;
  }

  T1 t1 = t0Instance;
  t1 = t0Instance;
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();

  }
}

main() {
  test<S0>(t0Instance);
}
