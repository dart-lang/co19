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
/// specified in the class header when it contains a primary constructor, and in
/// the part of the primary constructor that occurs in the body. Test enums.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

enum const E1(final int v) {
  e0(1);

  const this : assert(v > 0);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2.someName(final int v) {
  e0.someName(2);

  const this.someName : assert(v > 0);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
}
