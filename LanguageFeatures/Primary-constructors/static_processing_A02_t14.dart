// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, mixin class, enum, or
/// extension type has a primary constructor whose name is also the name of a
/// constructor declared in the body, or if it declares a primary constructor
/// whose name is `C.n`, and the body declares a static member whose basename is
/// `n`.
///
/// @description Check that it is a compile-time error if the name of the
/// primary constructor is the same as the name of some constructor declared in
/// the body. Test enums.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

enum const E1(final int v) {
  e0(1);

  const E1.someName(this.v);
//      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const E1(int v) : this.someName(v);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E2(final int v) {
  e0(2);
  const new(int v);
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E3.someName(final int v) {
  e0(3);
  const E3(this.v);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  const E3.someName(int v) : this(v);
//      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
  print(E3);
}
