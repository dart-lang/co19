// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything.
///
/// @description Checks that no entry named `_` is introduced into the enclosing
/// scope by a wildcarded declaration. Test callable local variables.
/// @author sgrekhov22@gmail.com

class C {}

test1() {
  var _ = () {};
  _();
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test2() {
  var _ = C.new;
  _();
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test3() {
  void _() {}
  _();
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  test1();
  test2();
  test3();
}
