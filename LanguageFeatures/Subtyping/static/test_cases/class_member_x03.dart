/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the mixin member of type T1
 * @author sgrekhov@unipro.ru
 */

class ClassMemberMixin1_t03 {
  @T1 m = t1Default;

  void set superSetter(dynamic val) {}
}

class ClassMember1_t03 extends Object with ClassMemberMixin1_t03 {
  test() {
    m = t0Instance;
    superSetter = t0Instance;
  }
}

main() {
  ClassMember1_t03 c1 = new ClassMember1_t03();
  c1.m = t0Instance;
  c1.test();
  c1.superSetter = t0Instance;
}
