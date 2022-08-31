// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// A record type A is a subtype of record type B iff they have same shape and
/// the types of all fields of A are subtypes of the corresponding field types
/// of B
///
/// @description Check that if type T0 is a record with another shape than T1
/// then T0 is not a subtype of T1
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as a class member of type T1. Assignment to static and instance class
/// variables is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from records_fail_A04.dart and 
/// class_member_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.



// SharedOptions=--enable-experiment=records

(int, String) t0Instance = (1, "2");
(int, String, {bool b}) t1Instance = (3, "4", b: true);

const t1Default = const (5, "6", b: false);




class ClassMemberTestStatic {
  static (int i, String s, {bool b}) s = t1Default;

  ClassMemberTestStatic((int i, String s) val) {
    s = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static staticTest() {
    s = t0Instance;
//      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static set staticSetter((int i, String s) val) {
    s = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static (int i, String s, {bool b}) get staticGetter => t0Instance;
//                               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class ClassMemberTestPublic {
  (int i, String s, {bool b}) m = t1Default;

  ClassMemberTestPublic((int i, String s) val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test((int i, String s) val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  set setter((int i, String s) val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  (int i, String s, {bool b}) get getter => t0Instance;
//                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class ClassMemberTestPrivate {
  (int i, String s, {bool b}) _m = t1Default;

  ClassMemberTestPrivate((int i, String s) val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test((int i, String s) val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  set setter((int i, String s) val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class ClassMemberTestInitFail {
  static (int i, String s, {bool b}) s = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  (int i, String s, {bool b}) m = t0Instance;
//        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new ClassMemberTestPublic.validConstructor().m = t0Instance;
//                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
