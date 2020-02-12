/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Reflexivity: T0 and T1 are the same type.
 * @description Check that if type T1 is the same type as T0 then T0 is a
 * subtype of a type T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the mixin member of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from reflexivity_A01.dart and 
 * class_member_x03.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
// SharedOptions=--enable-experiment=non-nullable
class T {
  const T();
}

T t0Instance = new T();
T t1Instance = new T();

const t1Default = const T();




class ClassMemberMixin1_t03 {
  T m = t1Default;

  void set superSetter(dynamic val) {}
}

class ClassMember1_t03 extends Object with ClassMemberMixin1_t03 {
  test() {
    m = forgetType(t0Instance);
    superSetter = forgetType(t0Instance);
  }
}

class ClassMemberMixin2_t03<X> {
  void set superSetter(dynamic val) {}
}

class ClassMember2_t03<X> extends Object with ClassMemberMixin2_t03<X> {
  X m;
  ClassMember2_t03(X x): m = x {  }
  test() {
    m = forgetType(t0Instance);
    superSetter = forgetType(t0Instance);
  }
}

main() {
  ClassMember1_t03 c1 = new ClassMember1_t03();
  c1.m = forgetType(t0Instance);
  c1.test();
  c1.superSetter = forgetType(t0Instance);

  // Test type parameters

  //# <-- NotGenericFunctionType
  ClassMember2_t03<T> c2 = new ClassMember2_t03<T>(t1Instance);
  c2.m = forgetType(t0Instance);
  c2.test();
  c2.superSetter = forgetType(t0Instance);
  //# -->
}
