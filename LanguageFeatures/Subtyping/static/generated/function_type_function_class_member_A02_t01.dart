// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Function Type/Function: T0 is a function type and T1 is Function
/// @description Check that if type T0 is a function type and T1 is Function then
/// T0 is a subtype of T1. Test void function without actual arguments but
/// returning some value
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the class member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/function_type_function_A02.dart and 
/// test_cases/class_member_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

class C {}

typedef void T0();

void t0Instance() => new C();

void foo() {}

class ClassMember1_t01 {
  static Function s = t0Instance;
  Function m = t0Instance;
  Function _p = t0Instance;

  ClassMember1_t01() {
    s = t0Instance;
    m = t0Instance;
    _p = t0Instance;
  }

  ClassMember1_t01.named(Function value) {
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

  set setter(Function val) {
    _p = val;
  }

  Function get getter => _p;

  static staticTest() {
    s = t0Instance;
  }

  static set staticSetter(Function val) {
    s = val;
  }

  static Function get staticGetter => t0Instance;
}

main() {
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
