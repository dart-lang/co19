// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Type Variable Reflexivity 1: T0 is a type variable X0 or a promoted type
/// variables X0 & S0 and T1 is X0
/// @description Check that if type T0 a promoted type variables X0 & S0 and T1
/// is X0 then T0 is a subtype of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from type_variable_reflexivity_1_A01.dart and 
/// local_variable_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.




class X0 {}
class S0 extends X0 {
}

X0 t0Instance = new S0();
X0 t1Instance = new X0();





class LocalVariableTest {

  LocalVariableTest() {
    X0 t1 = t0Instance;
    t1 = t0Instance;
  }

  static staticTest() {
    X0 t1 = t0Instance;
    t1 = t0Instance;
  }

  test() {
    X0 t1 = t0Instance;
    t1 = t0Instance;
  }
}



main() {
  X0 t0Instance = new S0();
  if (t0Instance is S0) {
    
  foo() {
    X0 t1 = t0Instance;
    t1 = t0Instance;
  }

  X0 t1 = t0Instance;
  t1 = t0Instance;
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();

  }
}
