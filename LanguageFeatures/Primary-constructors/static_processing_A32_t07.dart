// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, mixin class, enum, or
/// extension type has a primary constructor which has a body part that includes
/// any of the modifiers `async`, `async*`, or `sync*`, or if it uses `=>`
/// rather than a block.
///
/// @description Check that it is a syntax error if a primary constructor has a
/// body part that uses `async* =>` or `sync* =>` syntax.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1(var int x) {
  this async* => this;
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(var int x) {
this: assert(x > 0) async* => this;
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3(var int x) {
  this sync* => this;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4(var int x) {
  this: assert(x > 0) sync* => this;
//                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1(int x) {
  this async* => this;
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int x) {
  this: assert(x > 0) async* => this;
//                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(int x) {
  this sync* => this;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4(int x) {
  this: assert(x > 0) sync* => this;
//                    ^^^^^
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
  print(ET3);
  print(ET4);
}
