// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Top: if T0 is dynamic or void then T0 <: T1 if Object? <: T1
/// @description Check that if type T0 is dynamic and Object? <: T1 then T0 is a
/// subtype of a type T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/left_top_A01.dart and 
/// test_cases/local_variable_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

dynamic t0Instance = "Show must go on";
Object? t1Instance = new Object();

const t1Default = const Object();

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
