// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, mixin class, enum, or
/// extension type has a primary constructor which has a body part that includes
/// any of the modifiers `async`, `async*`, or `sync*`, or if it uses `=>`
/// rather than a block.
///
/// @description Check that it is a syntax error if a primary constructor of an
/// enum has a body part that includes `async`, `async*`, or `sync*`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

enum E1(final int x) {
  e0(0);
  this async;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2(final int x) {
  e0(0);
  this: assert(x > 0) async;
//                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3(final int x) {
  e0(0);
  this async*;
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4(final int x) {
  e0(0);
  this: assert(x > 0) async*;
//                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E5(final int x) {
  e0(0);
  this sync*;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E6(final int x) {
  e0(0);
  this: assert(x > 0) sync*;
//                    ^^^^^
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
}
