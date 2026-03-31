// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, mixin class, enum, or
/// extension type has a primary constructor which has a body part that includes
/// any of the modifiers `async`, `async*`, or `sync*`, or if it uses `=>`
/// rather than a block.
///
/// @description Check that it is a syntax error if a primary constructor of a
/// mixin class has a body part that includes `async`, `async*`, or `sync*`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

mixin class M1() {
  this async;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M2() {
  this async*;
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}


mixin class M3() {
  this sync*;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(M1);
  print(M2);
  print(M3);
}
