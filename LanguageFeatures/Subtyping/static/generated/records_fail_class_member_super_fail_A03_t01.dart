// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// A record type A is a subtype of record type B iff they have same shape and
/// the types of all fields of A are subtypes of the corresponding field types
/// of B
///
/// @description Check that if type T0 is a record with the other shape than T1
/// then T0 is not subtype of T1
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be assigned to the superclass member of type T1.
/// Assignment to variable of super class is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from records_fail_A03.dart and 
/// class_member_super_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.



// SharedOptions=--enable-experiment=records

(int, String, {bool b}) t0Instance = (1, "2", b: true);
(int, String) t1Instance = (3, "4");

const t1Default = const (5, "6");




class ClassMemberSuper1_t02 {
  (int i, String s) m = t1Default;

  ClassMemberSuper1_t02((int i, String s, {bool b}) value) {
    m = value;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ClassMemberSuper1_t02.named((int i, String s, {bool b}) value) {
    m = value;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ClassMemberSuper1_t02.valid((int i, String s) value) {
    m = value;
  }
  void set superSetter((int i, String s) val) {}
}

class ClassMember1_t02 extends ClassMemberSuper1_t02 {
  ClassMember1_t02() : super(t0Instance) {}
  ClassMember1_t02.named() : super.named(t0Instance) {}
  ClassMember1_t02.valid() : super.valid(t1Default);
  test1() {
    m = t0Instance;
//      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  test2() {
    superSetter = t0Instance;
//                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new ClassMember1_t02.valid().m = t0Instance;
//                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ClassMember1_t02.valid().superSetter = t0Instance;
//                                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
