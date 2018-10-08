/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as a class member of type T1. Assignment to static and instance class
 * variables is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ClassMemberTestStatic {
  static @T1 s;

  ClassMemberTestStatic(@T0 val) {
    s = val; //# 01: compile-time error
  }

  static staticTest() {
    s = t0Instance; //# 04: compile-time error
  }

  static set staticSetter(@T0 val) {
    s = val; //# 02: compile-time error
  }

  static @T1 get staticGetter => t0Instance; //# 03: compile-time error
}

class ClassMemberTestPublic {
  @T1 m;

  ClassMemberTestPublic(@T0 val) {
    m = val; //# 05: compile-time error
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(@T0 val) {
    m = val; //# 08: compile-time error
  }

  set setter(@T0 val) {
    m = val; //# 07: compile-time error
  }

  @T1 get getter => t0Instance; //# 09: compile-time error
}

class ClassMemberTestPrivate {
  @T1 _m;

  ClassMemberTestPrivate(@T0 val) {
    _m = val; //# 10: compile-time error
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(@T0 val) {
    _m = val; //# 12: compile-time error
  }

  set setter(@T0 val) {
    _m = val; //# 11: compile-time error
  }
}

class ClassMemberTestInitFail {
  static @T1 s = t0Instance; //# 13: compile-time error
  @T1 m = t0Instance; //# 14: compile-time error
}


main() {
  new ClassMemberTestStatic(t0Instance); //# 01: compile-time error
  ClassMemberTestStatic.staticSetter = t0Instance; //# 02: compile-time error
  ClassMemberTestStatic.staticGetter; //# 03: compile-time error
  ClassMemberTestStatic.staticTest(); //# 04: compile-time error
  new ClassMemberTestPublic(t0Instance); //# 05: compile-time error
  new ClassMemberTestPublic.validConstructor().m = t0Instance; //# 06: compile-time error
  new ClassMemberTestPublic.validConstructor().setter = t0Instance; //# 07: compile-time error
  new ClassMemberTestPublic.validConstructor().test(t0Instance); //# 08: compile-time error
  new ClassMemberTestPublic.validConstructor().getter; //# 09: compile-time error
  new ClassMemberTestPrivate(t0Instance); //# 10: compile-time error
  new ClassMemberTestPrivate.validConstructor().setter = t0Instance; //# 11: compile-time error
  new ClassMemberTestPrivate.validConstructor().test(t0Instance); //# 12: compile-time error
  ClassMemberTestInitFail.s; //# 13: compile-time error
  new ClassMemberTestInitFail(); //# 14: compile-time error
}

