// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if the name of the primary
/// constructor is the same as the name of a constructor (declaring or not) in
/// the body.
///
/// @description Check that it is a compile-time error if the name of the
/// declaring constructor is the same as the name of some constructor declared
/// in the body. Test enums.
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
  const this(final int v);
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E3.someName(final int v) {
  e0(3);
  const E3.someName(this.v);
//      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E4.someName(final int v) {
  e0(4);
  const E4(this.v);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  const E4.someName(int v) : this(v);
//      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
}
