// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Nullable: if T0 is S0? then:
/// - T0 <: T1 iff S0 <: T1 and Null <: T1
/// @description Check that if type T0 is S0? and S0 <: T1 and Null <: T1 then
/// T0 is subtype of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the class member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/left_nullable_A01.dart and 
/// test_cases/class_member_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

class T1 {
  const T1();
}
class S0 extends T1 {
  const S0();
}

S0? t0Instance = new S0();
T1? t1Instance = new T1();

const t1Default = const T1();

class ClassMember1_t01 {
  static T1? s = forgetType(t0Instance);
  T1? m = forgetType(t0Instance);
  T1? _p = forgetType(t0Instance);

  ClassMember1_t01() {
    s = forgetType(t0Instance);
    m = forgetType(t0Instance);
    _p = forgetType(t0Instance);
  }

  ClassMember1_t01.named(T1? value) {
    s = value;
    m = value;
    _p = value;
  }

  ClassMember1_t01.short(this.m, this._p);

  test() {
    s = forgetType(t0Instance);
    m = forgetType(t0Instance);
    _p = forgetType(t0Instance);
  }

  set setter(T1? val) {
    _p = val;
  }

  T1? get getter => forgetType(_p);

  static staticTest() {
    s = forgetType(t0Instance);
  }

  static set staticSetter(T1? val) {
    s = val;
  }

  static T1? get staticGetter => forgetType(t0Instance);
}

class ClassMember2_t01<X> {
  X m;
  X _p;

  ClassMember2_t01():  m = forgetType(t0Instance), _p = forgetType(t0Instance) {
  }

  ClassMember2_t01.named(X value): m = value, _p = value {
  }

  ClassMember2_t01.short(this.m, this._p);

  test(X v) {
    m = v;
    _p = v;
  }

  set setter(X val) {
    _p = val;
  }

  T1? get getter => forgetType(_p);
}

main() {
  ClassMember1_t01 c1 = new ClassMember1_t01();
  c1 = new ClassMember1_t01.short(forgetType(t0Instance),
      forgetType(t0Instance));
  c1 = new ClassMember1_t01.named(forgetType(t0Instance));
  c1.m = forgetType(t0Instance);
  c1.test();
  c1.setter = forgetType(t0Instance);
  c1.getter;

  ClassMember1_t01.s = forgetType(t0Instance);
  ClassMember1_t01.staticTest();
  ClassMember1_t01.staticSetter = forgetType(t0Instance);
  ClassMember1_t01.staticGetter;

  // Test type parameters

  ClassMember2_t01<T1?> c2 = new ClassMember2_t01<T1?>();
  c2 = new ClassMember2_t01<T1?>.short(forgetType(t0Instance),
  forgetType(t0Instance));
  c2 = new ClassMember2_t01<T1?>.named(forgetType(t0Instance));
  c2.m = forgetType(t0Instance);
  c2.test(forgetType(t0Instance));
  c2.getter;
}
