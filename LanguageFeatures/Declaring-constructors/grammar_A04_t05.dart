// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The keyword `const` can be specified in the class header when it
/// contains a primary constructor, and in this case `const` can not be
/// specified in the part of the primary constructor that occurs in the body
/// (that is, the declaration that starts with this and contains an initializer
/// list and/or a constructor body, if any). The rationale is that when the
/// class header contains any parts of a declaring constructor, the class header
/// must be the location where all parts of the signature of that primary
/// constructor are specified.
///
/// @description Check that it is a compile-time error if a class header
/// contains a primary constructor and the keyword const is specified before its
/// `this` part in the body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class C1() {
  final int v;
  const this : v = 0;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(int v) {
  const this : assert(v > 0);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3.someName(final int v) {
  const this.someName : assert(v > 0);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4.someName() {
  int v;
  const this.someName : v = 0;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1(int v) {
  const this: assert(v > 0);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2.someName(int v) {
  const this.someName: assert(v > 0);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1() {
  e0;
  final int v;
  const this : v = 0;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2(int v) {
  e0(1);
  const this : assert(v > 0);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3.someName(final int v) {
  e0.someName(0);
  const this.someName : assert(v > 0);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4.someName() {
  e0.someName();
  final int v;
  const this.someName : v = 0;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(ET1);
  print(ET2);
  print(E1);
  print(E2);
  print(E3);
  print(E4);
}
