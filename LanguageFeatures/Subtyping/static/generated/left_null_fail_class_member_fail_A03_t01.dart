// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Null: if T0 is Null then:
/// - if T1 is a type variable (promoted or not) the query is false
/// - If T1 is FutureOr<S> for some S, then the query is true iff Null <: S.
/// - If T1 is Null, S? or S* for some S, then the query is true.
/// - Otherwise, the query is false
/// @description Check that otherwise, the query is false. Test some class S
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as a class member of type T1. Assignment to static and instance class
/// variables is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from left_null_fail_A03.dart and 
/// class_member_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.




Null t0Instance = null;
Object t1Instance = new Object();

const t1Default = const Object();




class ClassMemberTestStatic {
  static Object s = t1Default;

  ClassMemberTestStatic(Null val) {
    s = val;
  }

  static staticTest() {
    s = t0Instance;
  }

  static set staticSetter(Null val) {
    s = val;
  }

  static Object get staticGetter => t0Instance;
}

class ClassMemberTestPublic {
  Object m = t1Default;

  ClassMemberTestPublic(Null val) {
    m = val;
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(Null val) {
    m = val;
  }

  set setter(Null val) {
    m = val;
  }

  Object get getter => t0Instance;
}

class ClassMemberTestPrivate {
  Object _m = t1Default;

  ClassMemberTestPrivate(Null val) {
    _m = val;
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(Null val) {
    _m = val;
  }

  set setter(Null val) {
    _m = val;
  }
}

class ClassMemberTestInitFail {
  static Object s = t0Instance;
  Object m = t0Instance;
}

main() {
  new ClassMemberTestPublic.validConstructor().m = t0Instance;
}
