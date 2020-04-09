/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Legacy T1 is S1* then:
 * - T0 <: T1 iff T0 <: S1?
 * @description Check that if type T1 is S1* and T0 <: S1? then T0 is subtype of
 * T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the class member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_legacy_A01.dart and 
 * class_member_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../utils/legacy_lib.dart";

class C extends X {}

C? t0Instance = new C();
X t1Instance = new X();

const t1Default = const X();




class ClassMember1_t01 {
  static X s = forgetType(t0Instance);
  X m = forgetType(t0Instance);
  X _p = forgetType(t0Instance);

  ClassMember1_t01() {
    s = forgetType(t0Instance);
    m = forgetType(t0Instance);
    _p = forgetType(t0Instance);
  }

  ClassMember1_t01.named(X value) {
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

  set setter(X val) {
    _p = val;
  }

  X get getter => forgetType(_p);

  static staticTest() {
    s = forgetType(t0Instance);
  }

  static set staticSetter(X val) {
    s = val;
  }

  static X get staticGetter => forgetType(t0Instance);
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

  X get getter => forgetType(_p);
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

  //# <-- NotGenericFunctionType
  ClassMember2_t01<X> c2 = new ClassMember2_t01<X>();
  c2 = new ClassMember2_t01<X>.short(forgetType(t0Instance),
  forgetType(t0Instance));
  c2 = new ClassMember2_t01<X>.named(forgetType(t0Instance));
  c2.m = forgetType(t0Instance);
  c2.test(forgetType(t0Instance));
  c2.getter;
  //# -->
}
