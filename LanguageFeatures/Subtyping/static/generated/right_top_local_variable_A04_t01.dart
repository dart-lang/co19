// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right Top: T1 is a top type (i.e. Object, dynamic, or void)
/// @description Check that if type T1 is a dynamic and T0 is an Object then
/// T0 is a subtype of a type T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from right_top_A04.dart and 
/// local_variable_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


// @dart = 2.9



Object t0Instance = new Object();
dynamic t1Instance = 2018;


// @dart = 2.9



class LocalVariableTest {

  LocalVariableTest() {
    dynamic t1 = t0Instance;
    t1 = t0Instance;
  }

  static staticTest() {
    dynamic t1 = t0Instance;
    t1 = t0Instance;
  }

  test() {
    dynamic t1 = t0Instance;
    t1 = t0Instance;
  }
}

main() {
  foo() {
    dynamic t1 = t0Instance;
    t1 = t0Instance;
  }

  dynamic t1 = t0Instance;
  t1 = t0Instance;
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
