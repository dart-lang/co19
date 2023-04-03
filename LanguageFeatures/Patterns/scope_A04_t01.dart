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
///
/// @description Checks that it is a compile-time error if a variable is
/// referenced not in a case scope where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

void test1() {
  switch (42) {
    case [var x]:
      print(v);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case var v:
      print(v);
      break;
    case 0:
//  ^^^^
// [analyzer] HINT.UNREACHABLE_SWITCH_CASE
      print(v);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    default:
      print(v);
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void test2() {
  var z = switch (42) {
    [var x] => v,
//             ^
// [analyzer] unspecified
// [cfe] unspecified
    var v => v,
    0 => v,
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => v
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };
  print(z);
}

void test3() {
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  if (42 case var v) {
    print(v);
  }
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test4() {
  List l = [
    v - 1,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    if (42 case final int v) v else 1,
    v + 2
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
