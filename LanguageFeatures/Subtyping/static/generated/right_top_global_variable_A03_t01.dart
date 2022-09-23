// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right Top: T1 is a top type (i.e. Object, dynamic, or void)
/// @description Check that if type T1 is an Object and T0 is a dynamic then
/// T0 is a subtype of a type T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to global variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/right_top_A03.dart and 
/// test_cases/global_variable_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

dynamic t0Instance = "";
Object? t1Instance = new Object();

const t1Default = null;

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
  bar () {
    t1Instance = t0Instance;
  }

  t1Instance = t0Instance;
  bar();
  GlobalVariableTest t = new GlobalVariableTest();
  t.foo();
  GlobalVariableTest.test();
}
