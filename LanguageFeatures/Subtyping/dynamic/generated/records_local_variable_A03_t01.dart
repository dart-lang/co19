// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// A record type A is a subtype of record type B iff they have same shape and
/// the types of all fields of A are subtypes of the corresponding field types
/// of B
/// 
/// @description Check that if type T0 is a record with the same shape that T1
/// and the types of all fields of T0 is subtype of of the corresponding field
/// types of T1 then T0 is subtype of T1. Check named fields only
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from records_A03.dart and 
/// local_variable_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


import '../../utils/common.dart';

// SharedOptions=--enable-experiment=records

({int x, double y, String z}) t0Instance = (x: 42, y: 3.14, z: "");
({String? z, num y, num x}) t1Instance = (y: 1, z: null, x: 0.1);

const t1Default = (y: 1, z: null, x: 0.1);




class LocalVariableTest {

  LocalVariableTest() {
    ({String? z, num y, num x}) t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  static staticTest() {
    ({String? z, num y, num x}) t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  test() {
    ({String? z, num y, num x}) t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }
}

main() {
  foo() {
    ({String? z, num y, num x}) t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  ({String? z, num y, num x}) t1 = forgetType(t0Instance);
  t1 = forgetType(t0Instance);
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
