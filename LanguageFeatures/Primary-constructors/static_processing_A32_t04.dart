// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, mixin class, enum, or
/// extension type has a primary constructor which has a body part that includes
/// any of the modifiers `async`, `async*`, or `sync*`, or if it uses `=>`
/// rather than a block.
///
/// @description Check that it is a compile-time error if a primary constructor
/// has a body part that uses `=>` rather than a block.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1(var int x) {
  this => this;
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(var int x) {
  this: assert(x > 0) => this;
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M1(var int x) {
  this => this;
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M2(var int x) {
  this: assert(x > 0) => this;
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1(final int x) {
  e0(0);
  this => e0;
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2(final int x) {
  e0(0);
  this: assert(x > 0) => e0;
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1(int x) {
  this => this;
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int x) {
  this: assert(x > 0) => this;
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(M1);
  print(M2);
  print(ET1);
  print(ET2);
}
