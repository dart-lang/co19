/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Top: T1 is a top type (i.e. Object?, dynamic, or void)
 * @description Check that if type T1 is an Object then T0 is a subtype of a
 * type T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the class member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_top_A01.dart and 
 * class_member_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class T0 {}

T0 t0Instance = new T0();
Object? t1Instance = new Object();

const t1Default = null;




class ClassMember1_t01 {
  static Object? s = t0Instance;
  Object? m = t0Instance;
  Object? _p = t0Instance;

  ClassMember1_t01() {
    s = t0Instance;
    m = t0Instance;
    _p = t0Instance;
  }

  ClassMember1_t01.named(Object? value) {
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

  set setter(Object? val) {
    _p = val;
  }

  Object? get getter => _p;

  static staticTest() {
    s = t0Instance;
  }

  static set staticSetter(Object? val) {
    s = val;
  }

  static Object? get staticGetter => t0Instance;
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
