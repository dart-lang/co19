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
/// instance of T0 cannot be assigned to the superclass member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from records_fail_A05.dart and 
/// class_member_fail_x02.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

// SharedOptions=--enable-experiment=records

(int, String, {bool b0}) t0Instance = (1, "2", b0: true);
(int, String, {bool b1}) t1Instance = (3, "4", b1: false);

const t1Default = const (5, "6", b1: false);



class ClassMemberSuper1_t02 {
  (int i, String s, {bool b1}) m = t1Default;

  ClassMemberSuper1_t02(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.named(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.short(this.m);

  void set superSetter((int i, String s, {bool b1}) val) {}
}

class ClassMember1_t02 extends ClassMemberSuper1_t02 {

  ClassMember1_t02() : super(forgetType(t0Instance)) {}

  ClassMember1_t02.named() : super.named(forgetType(t0Instance)) {}

  ClassMember1_t02.short() : super.short(forgetType(t0Instance));

  ClassMember1_t02.valid() : super(null);

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

class ClassMemberSuper2_t02<X> {
  X m;

  ClassMemberSuper2_t02(X value): m = value {
  }

  ClassMemberSuper2_t02.named(X value): m = value {
  }

  ClassMemberSuper2_t02.short(this.m);

  void set superSetter(X val) {}
}

class ClassMember2_t02<X> extends ClassMemberSuper2_t02<X> {

  ClassMember2_t02() : super(forgetType(t0Instance)) {}

  ClassMember2_t02.named() : super.named(forgetType(t0Instance)) {}

  ClassMember2_t02.short() : super.short(forgetType(t0Instance));

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

main() {
  Expect.throws(() {
    new ClassMember1_t02();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02.short();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02.named();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02().m = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02().test1();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t02().test2();
  }, (e) => e is TypeError);

  // Test type parameters

  //# <-- NotGenericFunctionType
  Expect.throws(() {
    new ClassMember2_t02<(int i, String s, {bool b1})>();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<(int i, String s, {bool b1})>.short();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<(int i, String s, {bool b1})>.named();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<(int i, String s, {bool b1})>().m = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<(int i, String s, {bool b1})>().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<(int i, String s, {bool b1})>().test1();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t02<(int i, String s, {bool b1})>().test2();
  }, (e) => e is TypeError);
  //# -->
}
