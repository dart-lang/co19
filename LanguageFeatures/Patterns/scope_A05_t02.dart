// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The variables defined by a pattern and its subpatterns (its
/// pattern variable set, defined above), are introduced into a scope based on
/// where the pattern appears:
/// ...
/// Switch statement, switch expression, if-case statement, if-case-element:
/// Each guardedPattern introduces a new case scope which is where the variables
/// defined by that case's pattern are bound.
/// ...
/// The guard expression is evaluated in its case's case scope.
///
/// @description Checks that it is a compile-time error if a variable defined in
/// a guard expression is referenced outside of its case scope
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

void test1() {
  switch (42) {
    case var [x]:
      print(z);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case var v when (var z = 1) > 0:
      print(z);
      break;
    case 0:
      print(z);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    default:
      print(z);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void test2() {
  var y = switch (42) {
    var [x] => z,
//             ^
// [analyzer] unspecified
// [cfe] unspecified
    final int v when (var z = 1) => 0 => v,
    0 => z,
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => z
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };
  print(y);
}

void test3() {
  print(z);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  if (42 case var v when (var z = 1) > 0) {
    print(z);
  }
  print(z);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test4() {
  List l = [
    z,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    if (42 case final int v when (final int z = 1) > 0) 2,
    z
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  ];
  print(l);
}


main() {
  test1();
  test2();
  test3();
  test4();
}
