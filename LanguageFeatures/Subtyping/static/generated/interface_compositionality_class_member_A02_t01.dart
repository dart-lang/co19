/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Interface Compositionality: T0 is an interface type
 * C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and each Si <: Ui
 * @description Check that if type T0 is an interface type
 * C0<S0, ..., Sk> and T1 is C0<U0, ..., Uk> and each Si <: Ui then T0 is a
 * subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the class member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from interface_compositionality_A02.dart and 
 * class_member_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
abstract class U0 {}
abstract class U1 {}
abstract class U2 {}

abstract class S0 extends U0 {}
abstract class S1 extends Object with U1 {}
class S2 = Object with U2;

class C0<X, Y, Z> {
  const C0();
}

C0<S0, S1, S2> t0Instance = new C0<S0, S1, S2>();
C0<U0, U1, U2> t1Instance = new C0<U0, U1, U2>();

const t1Default = const C0<U0, U1, U2>();




class ClassMember1_t01 {
  static C0<U0, U1, U2> s = t0Instance;
  C0<U0, U1, U2> m = t0Instance;
  C0<U0, U1, U2> _p = t0Instance;

  ClassMember1_t01() {
    s = t0Instance;
    m = t0Instance;
    _p = t0Instance;
  }

  ClassMember1_t01.named(C0<U0, U1, U2> value) {
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

  set setter(C0<U0, U1, U2> val) {
    _p = val;
  }

  C0<U0, U1, U2> get getter => _p;

  static staticTest() {
    s = t0Instance;
  }

  static set staticSetter(C0<U0, U1, U2> val) {
    s = val;
  }

  static C0<U0, U1, U2> get staticGetter => t0Instance;
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
