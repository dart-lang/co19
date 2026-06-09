// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A method `m` of a class `C` is subject to override inference if
/// it is missing one or more component types of its signature, and one or more
/// of the direct superinterfaces of `C` has a member named `m` (that is, `C.m`
/// overrides one or more declarations). Each missing type is filled in with the
/// corresponding type from the combined member signature `s` of `m` in the
/// direct superinterfaces of `C`.
///
/// A compile-time error occurs if `s` does not exist.
///
/// @description Checks that it is a compile-time error occurs if `s` does not
/// exist.
/// @author sgrekhov22@gmail.com

mixin class A {
  num m1() => 3.14;
  void m2(num v) {}
  void m3([num? v]) {}
  void m4({num? v}) {}
  void m5({required num v}) {}
}

mixin class B {
  String m1() => '0';
  void m2(String v) {}
  void m3([String? v]) {}
  void m4({String? v}) {}
  void m5({required String v}) {}
}

class C1 extends A implements B {
  m1() => 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified
  void m2(v) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m3([v]) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m4({v}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m5({required v}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 with A implements B {
  m1() => 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified
  void m2(v) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m3([v]) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m4({v}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m5({required v}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M on A implements B {
  m1() => '0';
//^^
// [analyzer] unspecified
// [cfe] unspecified
  void m2(v) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m3([v]) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m4({v}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m5({required v}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 implements A, B {
  e0;

  m1() => '0';
//^^
// [analyzer] unspecified
// [cfe] unspecified
  void m2(v) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m3([v]) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m4({v}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m5({required v}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 with A implements B {
  e0;

  m1() => '0';
//^^
// [analyzer] unspecified
// [cfe] unspecified
  void m2(v) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m3([v]) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m4({v}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  void m5({required v}) {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(M);
  print(E1);
  print(E2);
}
