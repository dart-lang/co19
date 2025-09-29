// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a class, enum, or extension type declaration `D` with a
/// declaring header constructor, also known as a primary constructor).
/// ...
/// A compile-time error occurs if the body of `D` contains a non-redirecting
/// generative constructor, unless `D` is an extension type.
///
/// @description Check that it is a compile-time error if the body of `D`
/// contains a non-redirecting generative constructor. Test an enum.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

enum const E1(final int v) {
  e0(1);

  const E1.someName(this.v);
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E2.someName(final int v) {
  e0(2);

  const E2(int x) : v = 42;
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
}
