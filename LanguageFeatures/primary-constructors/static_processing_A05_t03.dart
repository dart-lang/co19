// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if the name of the primary
/// constructor is the same as the name of a constructor (declaring or not) in
/// the body.
///
/// @description Check that it is a compile-time error if the name of the
/// primary constructor is the same as the name of some constructor declared in
/// the body. Test enums.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

enum const E1(final int v) {
  e0(1);

  const E1(this.v);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0(2);
  this(final int v);
  const E2(this.v);
//      ^^
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

enum E4 {
  e0(4);
  const this.someName(final int v);
  const E4.someName(this.v);
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
