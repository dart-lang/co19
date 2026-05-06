// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An identifier expression denoting a parameter of a constant
/// primary constructor that occurs in the initializer list of the body part of
/// the primary constructor, or in an initializing expression of a non-late
/// instance variable declaration, is potentially constant.
///
/// @description Check that it is a compile-time error if a parameter of a
/// constant primary constructor occurs in the initializer list of the body part
/// of the primary constructor in a constant expression. Test enums.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class A {
  const A();
}

class B {
  final A a;
  const B(this.a);
}

enum const E1(final A a) {
  e0(A());

  final B b;
  this : b = const B(a);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2(A a) {
  e0(A());

  final B b;
  this : b = const B(a);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3([final A? a]) {
  e0(A());

  final B? b;
  this : b = const B(a);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E4([A? a]) {
  e0(A());

  final B? b;
  this : b = const B(a);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E5({final A? a}) {
  e0(a: A());

  final B? b;
  this : b = const B(a);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E6({A? a}) {
  e0(a: A());

  final B? b;
  this : b = const B(a);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E7({required final A a}) {
  e0(a: A());

  final B b;
  this : b = const B(a);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E8({required A a}) {
  e0(a: A());

  final B b;
  this : b = const B(a);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(E5);
  print(E6);
  print(E7);
  print(E8);
}
