// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, enum, or extension type
/// has a primary constructor whose name is also the name of a constructor
/// declared in the body.
///
/// @description Check that it is a compile-time error if an enum has a primary
/// constructor whose name is also the name of a constructor declared in the
/// body.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

enum const E1(final int v) {
  e0(1);

  const E1(this.v);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E2(final int v) {
  e0(2);

  const E2.new(int v);
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E3.someName(final int v) {
  e0.someName(3);

  const E3.someName();
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E4._() {
  e0._(4);

  const E4._(int v);
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
}
