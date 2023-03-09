// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// A record type A is a subtype of record type B iff they have same shape and
/// the types of all fields of A are subtypes of the corresponding field types
/// of B
///
/// @description Check that if type T0 is a record with the same shape as T1
/// and the type of each field of T0 is a subtype of the corresponding field
/// types of T1 then T0 is a subtype of T1. Check positional and named fields
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/records_A02.dart and 
/// test_cases/local_variable_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=records

import '../../utils/common.dart';

(int x, double y, String, {int n1, String n2}) t0Instance =
  (n1: 1, n2: "n2", 42, 3.14, "");

class LocalVariableTest {

  LocalVariableTest() {
    (num, num, String?, {num n1, String? n2}) t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  static staticTest() {
    (num, num, String?, {num n1, String? n2}) t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  test() {
    (num, num, String?, {num n1, String? n2}) t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }
}

main() {
  foo() {
    (num, num, String?, {num n1, String? n2}) t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  (num, num, String?, {num n1, String? n2}) t1 = forgetType(t0Instance);
  t1 = forgetType(t0Instance);
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
