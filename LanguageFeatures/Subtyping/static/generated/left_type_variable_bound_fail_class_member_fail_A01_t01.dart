// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Type Variable Bound: T0 is a type variable X0 with bound B0
///   and B0 <: T1
/// @description Check that if T0 is a type variable X0 with bound B0 and
/// B0 is not a subtype of T1 then T0 is not a subtype of a type T1.
/// @author ngl@unipro.ru
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as a class member of type T1. Assignment to static and instance class
/// variables is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from left_type_variable_bound_fail_A01.dart and 
/// class_member_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.



class T1 {
  const T1();
}
class B0 {}
class X0 extends B0 {}

X0 t0Instance = new X0();
T1 t1Instance = new T1();

const t1Default = const T1();




class ClassMemberTestStatic {
  static T1 s = t1Default;

  ClassMemberTestStatic(X0 val) {
    s = val;
  }

  static staticTest() {
    s = t0Instance;
  }

  static set staticSetter(X0 val) {
    s = val;
  }

  static T1 get staticGetter => t0Instance;
}

class ClassMemberTestPublic {
  T1 m = t1Default;

  ClassMemberTestPublic(X0 val) {
    m = val;
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(X0 val) {
    m = val;
  }

  set setter(X0 val) {
    m = val;
  }

  T1 get getter => t0Instance;
}

class ClassMemberTestPrivate {
  T1 _m = t1Default;

  ClassMemberTestPrivate(X0 val) {
    _m = val;
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(X0 val) {
    _m = val;
  }

  set setter(X0 val) {
    _m = val;
  }
}

class ClassMemberTestInitFail {
  static T1 s = t0Instance;
  T1 m = t0Instance;
}

main() {
  new ClassMemberTestPublic.validConstructor().m = t0Instance;
}
