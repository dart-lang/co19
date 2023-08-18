// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Reflexivity: T0 and T1 are the same type.
/// @description Check that if type T1 and T0 are both Null then T0 is a subtype
/// of a type T1
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/reflexivity_A04.dart and
/// test_cases/local_variable_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

Null t0Instance = null;

class LocalVariableTest {

  LocalVariableTest() {
    Null t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  static staticTest() {
    Null t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  test() {
    Null t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }
}

main() {
  foo() {
    Null t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  Null t1 = forgetType(t0Instance);
  t1 = forgetType(t0Instance);
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
