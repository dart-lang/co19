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
/// types of T1 then T0 is subtype of T1. Check positional and named fields
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the mixin member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from records_A02.dart and 
/// class_member_x03.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.



// SharedOptions=--enable-experiment=records

(int x, double y, String, {int n1, String n2}) t0Instance =
  (n1: 1, n2: "n2", 42, 3.14, "");
(num, num z, String?, {num n1, String? n2}) t1Instance =
  (0, n1: 0, 0, n2: null, null);

const t1Default = (0, 0, null, {n1: 0.1, n2: ""});




class ClassMemberMixin1_t03 {
  (num, num, String?, {num n1, String? n2}) m = t1Default;

  void set superSetter(dynamic val) {}
}

class ClassMember1_t03 extends Object with ClassMemberMixin1_t03 {
  test() {
    m = t0Instance;
    superSetter = t0Instance;
  }
}

main() {
  ClassMember1_t03 c1 = new ClassMember1_t03();
  c1.m = t0Instance;
  c1.test();
  c1.superSetter = t0Instance;
}
