// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, mixin class, enum, or
/// extension type has a constant primary constructor which has a body part that
/// has a body.
///
/// @description Check that it is a compile-time error if a constant primary
/// constructor has body part that has a body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class const C(final int x) {
  this {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E(final int v) {
  e0(0);
  this {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET(int v) {
  this {}
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
