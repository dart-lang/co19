/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Nullable: if T1 is S1? then:
 *  T0 <: T1 iff any of the following hold:
 *  either T0 <: S1
 *  or T0 <: Null
 *  or T0 is X0 and X0 has bound S0 and S0 <: T1
 *  or T0 is X0 & S0 and S0 <: T1
 * @description Check that if type T1 is S1? and T0 <: S1 then T0 is subtype of
 * T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the class member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_nullable_A01.dart and 
 * class_member_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable

class S1 {
  const S1();
}
class T0 extends S1 {}

T0 t0Instance = new T0();
S1? t1Instance = new S1();

const t1Default = const S1();




class ClassMember1_t01 {
  static S1? s = t0Instance;
  S1? m = t0Instance;
  S1? _p = t0Instance;

  ClassMember1_t01() {
    s = t0Instance;
    m = t0Instance;
    _p = t0Instance;
  }

  ClassMember1_t01.named(S1? value) {
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

  set setter(S1? val) {
    _p = val;
  }

  S1? get getter => _p;

  static staticTest() {
    s = t0Instance;
  }

  static set staticSetter(S1? val) {
    s = val;
  }

  static S1? get staticGetter => t0Instance;
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
