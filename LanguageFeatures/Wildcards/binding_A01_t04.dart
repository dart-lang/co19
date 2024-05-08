// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything.
///
/// @description Checks that no entry named `_` is introduced into the enclosing
/// scope by a wildcarded declaration. Test local variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcards

test1() {
  var _;
  print(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test2() {
  var _ = 0;
  print(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test3() {
  int? _;
  print(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test4() {
  int _ = 1;
  print(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test5() {
  final _ = 1;
  print(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test6() {
  dynamic _;
  print(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test7() {
  dynamic _ = 1;
  print(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  test1();
  test2();
  test3();
  test4();
  test5();
  test6();
  test7();
}
