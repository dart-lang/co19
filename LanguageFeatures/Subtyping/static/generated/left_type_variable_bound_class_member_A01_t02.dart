/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Type Variable Bound: T0 is a type variable X0 with bound B0
 *   and B0 <: T1
 * @description Check that if T0 is a type variable X0 with bound B0 and
 * B0 <: T1 then T0 is a subtype of a type T1
 * @author ngl@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the superclass member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_type_variable_bound_A01.dart and 
 * class_member_x02.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class T1 {
  const T1();
}
class B0 extends T1 {}
class X0 extends B0 {}

X0 t0Instance = new X0();
T1 t1Instance = new T1();

const t1Default = const T1();




class ClassMemberSuper1_t02 {
  T1 m = t1Default;

  ClassMemberSuper1_t02(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.named(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.short(this.m);

  void set superSetter(T1 val) {}
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
