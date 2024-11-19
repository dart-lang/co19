// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the static type of `e` is `void`, the expression `await e` is
/// a compile-time error.
///
/// @description Check that it is a compile-time error if in a `await e`
/// expression the static type of `e` is `void`.
/// @author sgrekhov22@gmail.com

void foo() {}

main() async {
  void e = 0;
  await e;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  await foo();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
