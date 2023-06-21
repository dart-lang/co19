// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Function Type/Function: T0 is a function type and T1 is Function
///
/// @description Check that tearing-off a method with covariant arguments strips
/// these arguments. Therefore, if `T0` is a function type with covariant
/// arguments and `T0` is a valid override of function type `T1`, but without
/// `covariant` keyword `T0` is not a valid override of `T1`, then `T0` is not a
/// subtype of `T1`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be assigned to the superclass member of type T1.
/// Assignment to variable of super class is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from test_types/function_type_covariant_arg_fail_A01.dart and 
/// test_cases/class_member_super_fail_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

class A {
  void foo(num n) => print("A");
}

class C implements A {
  void foo(covariant int n) => print("C");
}

C c = C();
void Function(int n) t0Instance = c.foo;

void baz(num n) {}
const t1Default = baz;

class ClassMemberSuper1_t02 {
  void Function(num n) m = t1Default;

  ClassMemberSuper1_t02(void Function(int n) value) {
    m = value;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ClassMemberSuper1_t02.named(void Function(int n) value) {
    m = value;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ClassMemberSuper1_t02.valid(void Function(num n) value) {
    m = value;
  }
  void set superSetter(void Function(num n) val) {}
}

class ClassMember1_t02 extends ClassMemberSuper1_t02 {
  ClassMember1_t02() : super(t0Instance) {}
  ClassMember1_t02.named() : super.named(t0Instance) {}
  ClassMember1_t02.valid() : super.valid(t1Default);
  test1() {
    m = t0Instance;
//      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  test2() {
    superSetter = t0Instance;
//                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new ClassMember1_t02.valid().m = t0Instance;
//                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ClassMember1_t02.valid().superSetter = t0Instance;
//                                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
