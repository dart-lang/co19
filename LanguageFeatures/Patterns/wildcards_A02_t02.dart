// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// If the variable's name is _, it doesn't bind any variable. This "wildcard"
/// name is useful as a placeholder in places where you need a subpattern in
/// order to destructure later positional values:
/// ```dart
/// var list = [1, 2, 3];
/// var [_, two, _] = list;
/// ```
/// The `_` identifier can also be used with a type annotation when you want to
/// test a value's type but not bind the value to a name:
/// ```dart
/// switch (record) {
///   case (int _, String _):
///     print('First field is int and second is String.');
/// }
/// ```
/// @description Checks that no entry named `_` is introduced into the enclosing
/// scope by a wildcarded declaration. Test patterns.
/// @author sgrekhov22@gmail.com

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
