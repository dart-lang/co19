// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right Promoted Variable: if T1 is a promoted type variable X1 & S1 then:
/// - T0 <: T1 iff T0 <: X1 and T0 <: S1
/// @description Check that if type T1 is a promoted type variables X1 & S1 and
/// T0 <: X1 and T0 <: S1 then T0 is a subtype of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the class member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/right_promoted_variable_A01.dart and 
/// test_cases/class_member_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

class X1 {
  const X1();
}
class S1 extends X1 {
  const S1();
}

class T0 extends S1 {}

T0 t0Instance = new T0();
X1 t1Instance = new S1();

class ClassMember1_t01 {
  static S1 s = t0Instance;
  S1 m = t0Instance;
  S1 _p = t0Instance;

  ClassMember1_t01() {
    s = t0Instance;
    m = t0Instance;
    _p = t0Instance;
  }

  ClassMember1_t01.named(S1 value) {
    s = value;
    m = value;
    _p = value;
  }

  ClassMember1_t01.short(this.m, this._p);

  test() {
    s = t0Instance;
    m = t0Instance;
    _p = t0Instance;
  }

  set setter(S1 val) {
    _p = val;
  }

  S1 get getter => _p;

  static staticTest() {
    s = t0Instance;
  }

  static set staticSetter(S1 val) {
    s = val;
  }

  static S1 get staticGetter => t0Instance;
}

main() {
  X1 t1Instance = new S1();
  if (t1Instance is S1) {
    ClassMember1_t01 c1 = new ClassMember1_t01();
    c1 = new ClassMember1_t01.short(t0Instance,
        t0Instance);
    c1 = new ClassMember1_t01.named(t0Instance);
    c1.m = t0Instance;
    c1.test();
    c1.setter = t0Instance;
    c1.getter;

    ClassMember1_t01.s = t0Instance;
    ClassMember1_t01.staticTest();
    ClassMember1_t01.staticSetter = t0Instance;
    ClassMember1_t01.staticGetter;
  }
}
