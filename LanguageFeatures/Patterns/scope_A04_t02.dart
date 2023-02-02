// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The variables defined by a pattern and its subpatterns (its
/// pattern variable set, defined above), are introduced into a scope based on
/// where the pattern appears:
/// ...
/// Switch statement, switch expression, if-case statement, if-case-element:
/// ...
/// There is no initializing expression for the variables in a case pattern, but
/// they are considered initialized after the entire case pattern, before the
/// guard expression if there is one.
///
/// @description Checks that it is a compile-time error if a variable is
/// referenced in a guard expression but not in a case scope where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

void test1() {
  switch (42) {
    case [var x] when v > 0:
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case var v:
      print(v);
      break;
    case 0 when v < 0:
//              ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    default:
  }
}

void test2() {
  var z = switch (42) {
    [var x] when v > 0 => 1,
//               ^
// [analyzer] unspecified
// [cfe] unspecified
    var v => v,
    0 when v == 0 => 0,
//         ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => -1
  };
  print(z);
}

void test3() {
  if (42 case var x when v > 0) {
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
    print(x);
  }

  if (42 case var v) {
    print(v);
  }
  if (42 case var z when v > 0) {
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
    print(z);
  }
}

void test4() {
  List l = [
    if (42 case final int x when v > 0) x,
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
    if (42 case final int v) v else 1,
    if (42 case final int z when v < 0) z,
//                               ^
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
