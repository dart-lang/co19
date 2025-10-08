// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The keyword `const` can be specified in the class header when it
/// contains a primary constructor, and in this case `const` can not be
/// specified in the part of the primary constructor that occurs in the body
/// (that is, the declaration that starts with this and contains an initializer
/// list and/or a constructor body, if any). The rationale is that when the
/// class header contains any parts of a declaring constructor, the class header
/// must be the location where all parts of the signature of that primary
/// constructor are specified.
///
/// @description Check that it is a compile-time error if the keyword `const` is
/// specified in the class/extension type/enum header when it doesn't contain a
/// primary constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class const C1 {
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  this(final int v);
}

class const C2 {
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  this.someName();
}

extension type const ET1 {
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  this(final int v);
}

extension type const ET2 {
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  this.someName(final int v);
}

enum const E1 {
//   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0(1);

  const this(final int v);
}

enum const E2 {
//   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0;

  const this.someName();
}

main() {
  print(C1);
  print(C2);
  print(ET1);
  print(ET2);
  print(E1);
  print(E2);
}
