/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Type Variable Reflexivity 1: T0 is a type variable X0 or a promoted type
 * variables X0 & S0 and T1 is X0
 * @description Check that if type T0 a promoted type variables X0 & S0 and T1
 * is X0 then T0 is a subtype of T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the to global variable of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from type_variable_reflexivity_1_A01.dart and 
 * global_variable_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class X0 {
  const X0();
}
class S0 extends X0 {
}

X0 t0Instance = new S0();
X0 t1Instance = new X0();

const t1Default = const X0();




class GlobalVariableTest {
  GlobalVariableTest() {
    t1Instance = t0Instance;
  }

  foo() {
    t1Instance = t0Instance;
  }

  static test() {
    t1Instance = t0Instance;
  }
}



main() {
  X0 t0Instance = new S0();
  if (t0Instance is S0) {
    
  bar () {
    t1Instance = t0Instance;
  }

  t1Instance = t0Instance;
  bar();
  GlobalVariableTest t = new GlobalVariableTest();
  t.foo();
  GlobalVariableTest.test();

  }
}
