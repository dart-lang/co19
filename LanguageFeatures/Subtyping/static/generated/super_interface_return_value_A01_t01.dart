// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Super-Interface: T0 is an interface type with super-interfaces S0,...Sn
/// - and Si <: T1 for some i
/// @description Check that if type T0 is an interface type with super-interfaces
/// S0,...Sn and and Si <: T1 for some i then T0 is a subtype of a type T1
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from super_interface_A01.dart and 
/// return_value_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


// @dart = 2.9



class T1 {}

abstract class S0 extends T1 {}
abstract class S1 {}
abstract class S2 {}

abstract class T0 implements S0, S1, S2  {}

class T implements T0 {}

T0 t0Instance = new T();
T1 t1Instance = new T1();


// @dart = 2.9



T1 returnValueFunc() => t0Instance;

class ReturnValueTest {
  static T1 staticTestMethod() => t0Instance;

  T1 testMethod() => t0Instance;

  T1 get testGetter => t0Instance;
}

main() {
  T1 returnValueLocalFunc() => t0Instance;

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

}
