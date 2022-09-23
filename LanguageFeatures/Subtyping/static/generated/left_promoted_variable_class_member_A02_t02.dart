// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Promoted Variable: T0 is a promoted type variable X0 & S0
/// and S0 <: T1
/// @description Check that if type T0 is a promoted type variable X0 & S0 and S0
/// is subtype of T1 then T0 is a subtype of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the superclass member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/left_promoted_variable_A02.dart and 
/// test_cases/class_member_x02.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

class T1 {
  const T1();
}
class X0 {}
class S0 extends X0 implements T1 {}

S0 t0Instance = new S0();
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

test<T>(T t0Instance) {
  if (t0Instance is S0) {
    ClassMember1_t02 c1 = new ClassMember1_t02();
    c1 = new ClassMember1_t02.short();
    c1 = new ClassMember1_t02.named();
    c1.m = t0Instance;
    c1.test();
    c1.superSetter = t0Instance;
  }
}

main() {
  test<S0>(t0Instance);
}
