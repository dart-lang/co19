// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right Promoted Variable: if T1 is a promoted type variable X1 & S1 then:
/// - T0 <: T1 iff T0 <: X1 and T0 <: S1
/// @description Check that if type T1 is a promoted type variables X1 & S1 and
/// T0 <: X1 and T0 <: S1 then T0 is a subtype of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to global variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from right_promoted_variable_A01.dart and 
/// global_variable_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.



class X1 {
  const X1();
}
class S1 extends X1 {
  const S1();
}

class T0 extends S1 {}

T0 t0Instance = new T0();
X1 t1Instance = new S1();

const t1Default = const S1();




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
  X1 t1Instance = new S1();
  if (t1Instance is S1) {
    
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
