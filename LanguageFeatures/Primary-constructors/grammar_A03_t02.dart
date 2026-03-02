// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `D` be a class, extension type, or enum declaration.
///
/// A compile-time error occurs if `D` includes a `<classNameMaybePrimary>` that
/// does not contain a `<primaryConstructor>`, and the body of `D` contains a
/// member declaration that starts with a `<primaryConstructorBodySignature>`. A
/// compile-time error occurs if the body of `D` contains two or more member
/// declarations starting with a `<primaryConstructorBodySignature>`.
///
/// @description Check that it is a compile-time error if the body of `D`
/// contains two or more member declarations starting with a
/// `<primaryConstructorBodySignature>`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1() {
//    ^^
// [analyzer] unspecified
  int v1, v2;
  this : v1 = 1;
  this : v2 = 2;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(var int v1) {
//    ^^
// [analyzer] unspecified
  int v2;
  this;
  this: v2 = 3;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {
  int x = 0;
}

class C3(var int v1) extends A {
//    ^^
// [analyzer] unspecified
  int v2;
  this: v2 = 2;
  this: super(3);
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1(final int v1) {
//   ^^^
// [analyzer] unspecified
  e0(0);

  final int v2;
  this;
  this: v2 = 2;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2(final int v1) {
  e0(0);

  final int v2;
  this: v2 = 0;
  this;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1(int v) {
  this : assert(v > 0);
  this : assert(v != 0);
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int v) {
  this;
  this : assert(v >= 0);
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
  print(ET1);
  print(ET2);
}
