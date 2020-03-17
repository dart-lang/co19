/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left FutureOr: T0 is FutureOr<S0>
 *   and Future<S0> <: T1
 *   and S0 <: T1
 * @description Check that if a type T0 is FutureOr<S0> and Future<S0> and S0
 * are subtypes of a type T1, then a type T0 is a subtype of a type T1. Case
 * when an instance of T0 is an instance of Future<S0> type.
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the class member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_FutureOr_A02.dart and 
 * class_member_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
// SharedOptions=--enable-experiment=non-nullable
import "dart:async";

class C {
  const C();
}
class S0 extends C {}

FutureOr<S0> t0Instance = new Future<S0>.value(new S0());
FutureOr<C> t1Instance = new Future<C>.value(new C());

const t1Default = const C();




class ClassMember1_t01 {
  static FutureOr<C> s = forgetType(t0Instance);
  FutureOr<C> m = forgetType(t0Instance);
  FutureOr<C> _p = forgetType(t0Instance);

  ClassMember1_t01() {
    s = forgetType(t0Instance);
    m = forgetType(t0Instance);
    _p = forgetType(t0Instance);
  }

  ClassMember1_t01.named(FutureOr<C> value) {
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

  set setter(FutureOr<C> val) {
    _p = val;
  }

  FutureOr<C> get getter => forgetType(_p);

  static staticTest() {
    s = forgetType(t0Instance);
  }

  static set staticSetter(FutureOr<C> val) {
    s = val;
  }

  static FutureOr<C> get staticGetter => forgetType(t0Instance);
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

  FutureOr<C> get getter => forgetType(_p);
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
  ClassMember2_t01<FutureOr<C>> c2 = new ClassMember2_t01<FutureOr<C>>();
  c2 = new ClassMember2_t01<FutureOr<C>>.short(forgetType(t0Instance),
  forgetType(t0Instance));
  c2 = new ClassMember2_t01<FutureOr<C>>.named(forgetType(t0Instance));
  c2.m = forgetType(t0Instance);
  c2.test(forgetType(t0Instance));
  c2.getter;
  //# -->
}
