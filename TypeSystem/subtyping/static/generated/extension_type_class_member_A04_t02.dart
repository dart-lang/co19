// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Assume that DV declares an extension type declaration named Name with type
/// parameters X1 .. Xs, and V1 is a superinterface of DV. Then Name<T1, .. Ts>
/// is a subtype of [T1/X1 .. Ts/Xs]V1 for all T1, .. Ts.
///
/// @description Check that if type `T0` is an extension type `V` with type
/// parameters `X1 .. Xs`, and `V1` is a superinterface of `V`, then `V` is a
/// subtype of `[T1/X1 .. Ts/Xs]V1` for all `T1, .. Ts`.
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the superclass member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_A04.dart and
/// test_cases/class_member_x02.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

extension type const V1<T1, T2>(T1 id) {}

extension type V<T1, T2>(T1 id) implements V1<T1, T2> {}

V<int, String> t0Instance = V<int, String>(42);

const t1Default = const V1<num, Object>(0);

class ClassMemberSuper1_t02 {
  V1<num, Object> m = t1Default;

  ClassMemberSuper1_t02(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.named(dynamic value) {
    m = value;
  }

  ClassMemberSuper1_t02.short(this.m);

  void set superSetter(V1<num, Object> val) {}
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
