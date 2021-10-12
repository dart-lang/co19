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
/// of T0 can be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from right_promoted_variable_A01.dart and 
/// return_value_x01.dart.
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




S1 returnValueFunc() => t0Instance;

class ReturnValueTest {
  static S1 staticTestMethod() => t0Instance;

  S1 testMethod() => t0Instance;

  S1 get testGetter => t0Instance;
}



main() {
  X1 t1Instance = new S1();
  if (t1Instance is S1) {
    
  S1 returnValueLocalFunc() => t0Instance;

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;


  }
}
