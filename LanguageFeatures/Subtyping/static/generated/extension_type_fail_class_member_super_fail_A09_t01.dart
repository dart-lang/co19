// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Assume that T1, .. Ts are types, and V resolves to an extension type
/// declaration of the following form:
///
/// extension type V<X1 extends B1, .. Xs extends Bs>(T id) ... {
///   ... // Members.
/// }
/// It is then allowed to use V<T1, .. Tk> as a type.
///
/// @description Check that representation type of an inline class `V` is not
/// subtype of `V`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be assigned to the superclass member of type T1.
/// Assignment to variable of super class is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from test_types/extension_type_fail_A09.dart and 
/// test_cases/class_member_super_fail_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=inline-class

extension type V(int id) {}

V t0Instance = V(42);

const t1Default = -1;

class ClassMemberSuper1_t02 {
  int m = t1Default;

  ClassMemberSuper1_t02(V value) {
    m = value;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ClassMemberSuper1_t02.named(V value) {
    m = value;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ClassMemberSuper1_t02.valid(int value) {
    m = value;
  }
  void set superSetter(int val) {}
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
