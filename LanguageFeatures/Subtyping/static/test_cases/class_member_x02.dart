/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the superclass member of type T1
 * @author sgrekhov@unipro.ru
 */

class ClassMemberSuper1_t02 {
  @T1 m = t1Default;

  ClassMemberSuper1_t02(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.named(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.short(this.m);

  void set superSetter(@T1 val) {}
}

class ClassMember1_t02 extends ClassMemberSuper1_t02 {

  ClassMember1_t02() : super(t0Instance) {}

  ClassMember1_t02.named() : super.named(t0Instance) {}

  ClassMember1_t02.short() : super.short(t0Instance);

  test() {
    m = t0Instance;
    superSetter = t0Instance;
  }
}

main() {
  ClassMember1_t02 c1 = new ClassMember1_t02();
  c1 = new ClassMember1_t02.short();
  c1 = new ClassMember1_t02.named();
  c1.m = t0Instance;
  c1.test();
  c1.superSetter = t0Instance;
}
