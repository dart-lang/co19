// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
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
/// be used as a class member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/records_fail_A04.dart and 
/// test_cases/class_member_fail_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

// SharedOptions=--enable-experiment=records

(int, String) t0Instance = (1, "2");
(int, String, {bool b}) t1Instance = (3, "4", b: true);

const t1Default = const (5, "6", b: false);

class ClassMemberTestStatic {
  static (int i, String s, {bool b}) s = t1Default;

  ClassMemberTestStatic(dynamic val) {
    s = val;
  }

  static staticTest() {
    s = forgetType(t0Instance);
  }

  static set staticSetter(dynamic val) {
    s = val;
  }

  static (int i, String s, {bool b}) get staticGetter => forgetType(t0Instance);
}

class ClassMemberTestPublic {
  (int i, String s, {bool b}) m = t1Default;

  ClassMemberTestPublic(dynamic val) {
    m = val;
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(dynamic val) {
    m = val;
  }

  set setter(dynamic val) {
    m = val;
  }

  (int i, String s, {bool b}) get getter => forgetType(t0Instance);
}

class ClassMemberTestPrivate {
  (int i, String s, {bool b}) _m = t1Default;

  ClassMemberTestPrivate(dynamic val) {
    _m = val;
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(dynamic val) {
    _m = val;
  }

  set setter(dynamic val) {
    _m = val;
  }
}

class ClassMemberTestInitFail {
  static (int i, String s, {bool b}) s = forgetType(t0Instance);
  (int i, String s, {bool b}) m = forgetType(t0Instance);
}

class ClassMemberTestGenericPublic<X> {
  X m;

  ClassMemberTestGenericPublic(dynamic val): m = val {
  }

  ClassMemberTestGenericPublic.short(this.m);

  test(dynamic val) {
    m = val;
  }

  set setter(dynamic val) {
    m = val;
  }

  X get getter => forgetType(t0Instance);
}

class ClassMemberTestGenericPrivate<X> {
  X _m;

  ClassMemberTestGenericPrivate(dynamic val): _m = val {
  }

  ClassMemberTestGenericPrivate.short(this._m);

  test(dynamic val) {
    _m = val;
  }

  set setter(dynamic val) {
    _m = val;
  }
}

main() {
  // Test initialization
  Expect.throws(() {ClassMemberTestInitFail.s;}, (e) => e is TypeError);
  Expect.throws(() {new ClassMemberTestInitFail();}, (e) => e is TypeError);

  // Test constructors
  Expect.throws(() {
    new ClassMemberTestPublic(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPublic.short(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPrivate(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPrivate.short(forgetType(t0Instance));
  }, (e) => e is TypeError);

  // Test class variables
  Expect.throws(() {
    new ClassMemberTestPublic(t1Instance).m = forgetType(t0Instance);
  }, (e) => e is TypeError);

  // Test setters
  Expect.throws(() {
    new ClassMemberTestPublic(t1Instance).setter = t0Instance;
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPrivate(t1Instance).setter = t0Instance;
  }, (e) => e is TypeError);

  // Test methods
  Expect.throws(() {
    new ClassMemberTestPublic(t1Instance).test(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestPrivate(t1Instance).test(t0Instance);
  }, (e) => e is TypeError);

  // Test getters
  Expect.throws(() {
    new ClassMemberTestPublic(t1Instance).getter;
  }, (e) => e is TypeError);

  // Test static stuff
  Expect.throws(() {
    new ClassMemberTestStatic(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    ClassMemberTestStatic.staticSetter = t0Instance;
  }, (e) => e is TypeError);

  Expect.throws(() {
    ClassMemberTestStatic.staticGetter;
  }, (e) => e is TypeError);

  Expect.throws(() {
    ClassMemberTestStatic.staticTest();
  }, (e) => e is TypeError);

  // Test type parameters

  // Test getters
  Expect.throws(() {
    new ClassMemberTestGenericPublic<(int i, String s, {bool b})>(t1Instance).getter;
  }, (e) => e is TypeError);

  // Test methods
  Expect.throws(() {
    new ClassMemberTestGenericPublic<(int i, String s, {bool b})>(t1Instance).test(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<(int i, String s, {bool b})>(t1Instance).test(t0Instance);
  }, (e) => e is TypeError);

  // Test setters
  Expect.throws(() {
    new ClassMemberTestGenericPublic<(int i, String s, {bool b})>(t1Instance).setter = t0Instance;
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<(int i, String s, {bool b})>(t1Instance).setter = t0Instance;
  }, (e) => e is TypeError);

  // Test class variables
  Expect.throws(() {
    new ClassMemberTestGenericPublic<(int i, String s, {bool b})>(t1Instance).m = forgetType(t0Instance);
  }, (e) => e is TypeError);

  // Test constructors
  Expect.throws(() {
    new ClassMemberTestGenericPublic<(int i, String s, {bool b})>(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPublic<(int i, String s, {bool b})>.short(forgetType(t0Instance));
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<(int i, String s, {bool b})>(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ClassMemberTestGenericPrivate<(int i, String s, {bool b})>.short(forgetType(t0Instance));
  }, (e) => e is TypeError);
}
