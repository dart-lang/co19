/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the mixin member of type T1
 * @author sgrekhov@unipro.ru
 */

class ClassMemberSuper1_t03 {
  @T1 m = t1Default;

  void set superSetter(@T1 val) {}
}

class ClassMember1_t03 extends Object with ClassMemberSuper1_t03 {

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

class ClassMemberSuper2_t03<X> {
  X m;

  ClassMemberSuper2_t03(X x) : m = x {}

  void set superSetter(X val) {}
}

class ClassMember2_t03<X> extends ClassMemberSuper2_t03<X> {

  ClassMember2_t03(X x): super(x) {}

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

main() {
  Expect.throws(() {
    new ClassMember1_t03().m = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember1_t03().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember1_t03().test1();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember1_t03().test2();
  }, (e) => e is TypeError || e is CastError);

  // Test type parameters

  //# <-- NotGenericFunctionType
  Expect.throws(() {
    new ClassMember2_t03<@T1>(t1Instance).m = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t03<@T1>(t1Instance).superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t03<@T1>(t1Instance).test1();
  }, (e) => e is TypeError || e is CastError);
  Expect.throws(() {
    new ClassMember2_t03<@T1>(t1Instance).test2();
  }, (e) => e is TypeError || e is CastError);
  //# -->
}
