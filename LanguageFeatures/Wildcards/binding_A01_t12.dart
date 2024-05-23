// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error. The initializer, if there is
/// one, is still executed, but the value is not accessible.
///
/// @description Checks that no entry named `_` is introduced into the enclosing
/// scope by a wildcarded declaration. Test patterns.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class C {
  int a, b;
  C(this.a, this.b);
}

test1() {
  var (_) = (1);
  print(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test2() {
  final [_, x] = [2, 0];
  print(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test3() {
  var {"key1": _, "key2": x} = {"key1": 3, "key2": 1};
  print(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test4() {
  final (_, x) = (4, 2);
  print(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

test5() {
  var C(a: _, b: x) = C(5, 3);
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
}
