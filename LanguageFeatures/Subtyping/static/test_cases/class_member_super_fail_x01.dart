/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the superclass member of type T1.
 * Assignment to variable of super class is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ClassMemberSuper1_t02 {
  @T1 m;

  ClassMemberSuper1_t02(@T0 value) {
    m = value; //# 01: compile-time error
  }
  ClassMemberSuper1_t02.named(@T0 value) {
    m = value; //# 02: compile-time error
  }
  void set superSetter(@T1 val) {}
}

class ClassMember1_t02 extends ClassMemberSuper1_t02 {
  ClassMember1_t02() : super(t0Instance) {} //# 01: compile-time error
  ClassMember1_t02.named() : super.named(t0Instance) {} //# 02: compile-time error
  ClassMember1_t02.valid() : super(null);
  test1() {
    m = t0Instance; //# 05: compile-time error
  }
  test2() {
    superSetter = t0Instance; //# 06: compile-time error
  }
}

main() {
  new ClassMember1_t02(); //# 01: compile-time error
  new ClassMember1_t02.named(); //# 02: compile-time error
  new ClassMember1_t02.valid().m = t0Instance; //# 03: compile-time error
  new ClassMember1_t02.valid().superSetter = t0Instance; //# 04: compile-time error
  new ClassMember1_t02.valid().test1(); //# 05: compile-time error
  new ClassMember1_t02.valid().test2(); //# 06: compile-time error
}
