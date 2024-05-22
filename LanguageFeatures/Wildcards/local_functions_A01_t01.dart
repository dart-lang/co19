// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local function declaration named `_` is dead code and will
/// produce a warning because the function is unreachable.
///
/// @description Checks that it is a warning to declare a local function named
/// `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

test1() {
  _() {}
//^
// [analyzer] unspecified
  _();
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test2() {
  var _ = () {}; // Ok
  _();
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  test1();
  test2();
}
