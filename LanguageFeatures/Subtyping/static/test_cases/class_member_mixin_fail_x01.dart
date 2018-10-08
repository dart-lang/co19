/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the mixin member of type T1.
 * Assignment to instance variable of super class is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */

class ClassMemberSuper1_t03 {
  @T1 m;
  void set superSetter(@T1 val) {} //# 02: compile-time error
}

class ClassMember1_t03 extends Object with ClassMemberSuper1_t03 {
  test1() {
    m = t0Instance; //# 03: compile-time error
  }
  test2() {
    superSetter = t0Instance; //# 04: compile-time error
  }
}

main() {
  new ClassMember1_t03().m = t0Instance; //# 01: compile-time error
  new ClassMember1_t03().superSetter = t0Instance;  //# 02: compile-time error
  new ClassMember1_t03().test1();  //# 03: compile-time error
  new ClassMember1_t03().test2();  //# 04: compile-time error
}
