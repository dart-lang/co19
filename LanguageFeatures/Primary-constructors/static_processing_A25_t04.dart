// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A primary constructor declaration consists of a
/// `<primaryConstructor>` in the declaration header plus optionally a member
/// declaration in the body that starts with a
/// `<primaryConstructorBodySignature>`.
///
/// @description Check that it is a compile-time error if a
/// `<primaryConstructorBodySignature>` contains a body or initializer list but
/// the enclosing class is a mixin class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

mixin class M1() {
  this {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M2() {
  int v;
  this: v = 0;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(M1);
  print(M2);
}
