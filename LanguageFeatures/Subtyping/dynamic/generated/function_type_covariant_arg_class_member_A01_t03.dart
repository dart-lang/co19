// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Function Type/Function: T0 is a function type and T1 is Function
///
/// @description Check that if type `T0` is a function type with a covariant
/// arguments and `T1` is a function type with arguments that are supertypes of
/// `T0` arguments, then `T0` is a subtype of `T1`.
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the mixin member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/function_type_covariant_arg_A01.dart and 
/// test_cases/class_member_x03.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

class A {
  void foo(num n, [Object o = "A"]) => print("A");
}

class C implements A {
  void foo(covariant int n, [covariant String c = "C"]) => print("C");
}

A a = A();
A c = C();
void Function(num n, [Object o]) t0Instance = c.foo;
void Function(num n, [Object o]) t1Instance = a.foo;

void baz(num n, [Object o = ""]) {}
const t1Default = baz;

mixin class ClassMemberMixin1_t03 {
  void Function(num n, [Object o]) m = t1Default;

  void set superSetter(dynamic val) {}
}

class ClassMember1_t03 extends Object with ClassMemberMixin1_t03 {
  test() {
    m = forgetType(t0Instance);
    superSetter = forgetType(t0Instance);
  }
}

mixin class ClassMemberMixin2_t03<X> {
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

  ClassMember2_t03<void Function(num n, [Object o])> c2 = new ClassMember2_t03<void Function(num n, [Object o])>(t1Instance);
  c2.m = forgetType(t0Instance);
  c2.test();
  c2.superSetter = forgetType(t0Instance);
}
