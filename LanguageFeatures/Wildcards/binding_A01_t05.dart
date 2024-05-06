// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything.
///
/// @description Checks that it is a compile-time error to access the value of
/// a local declaration named `_`. Test callable local variables.
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

main() {
  test1();
  test2();
}
