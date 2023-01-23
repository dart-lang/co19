// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Promoted Variable: T0 is a promoted type variable X0 & S0
/// and S0 <: T1
/// @description Check that if type T0 is a promoted type variable X0 & S0 and S0
/// is subtype of T1 then T0 is a subtype of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from left_promoted_variable_A02.dart and 
/// return_value_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


// @dart = 2.9


class T1 {}
class X0 {}
class S0 extends X0 implements T1 {}


S0 t0Instance = new S0();
T1 t1Instance = new T1();


// @dart = 2.9



T1 returnValueFunc() => t0Instance;

class ReturnValueTest {
  static T1 staticTestMethod() => t0Instance;

  T1 testMethod() => t0Instance;

  T1 get testGetter => t0Instance;
}



test<T>(T t0Instance) {
  if (t0Instance is S0) {
  
  T1 returnValueLocalFunc() => t0Instance;

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;


  }
}

main() {
  test<S0>(t0Instance);
}
