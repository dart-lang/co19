// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
///
/// Here is an overview of the subtype relationships of an extension type V0
/// with instantiated representation type R and instantiated superinterface
/// types V1 .. Vk, as well as other typing relationships involving V0
/// ...
/// V0 is a proper subtype of each of V1 .. Vk
///
/// @description Check that if a type `T1` is an extension type `V0`
/// and `T0` is a superinterface of `T0` then `T0` is not a subtype of `T1`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be assigned to the mixin member of type T1.
/// Assignment to instance variable of super class is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from test_types/extension_type_fail_A03.dart and 
/// test_cases/class_member_mixin_fail_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=inline-class

extension type V1<T>(T i) {}
extension type const V0<T>(T i) implements V1<T> {}

V1<int> t0Instance = V1<int>(42);

const t1Default = const V0<int>(1);

mixin class ClassMemberSuper1_t03 {
  V0<int> m = t1Default;
  void set superSetter(V0<int> val) {}
}

class ClassMember1_t03 extends Object with ClassMemberSuper1_t03 {
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
  new ClassMember1_t03().m = t0Instance;
//                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ClassMember1_t03().superSetter = t0Instance;
//                                     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
