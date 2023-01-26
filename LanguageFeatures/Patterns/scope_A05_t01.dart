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
/// It is a compile-time error for a guard to contain an assignment to a
/// variable defined in the case that owns that guard.
///
/// @description Checks that it is a compile-time error for a guard to contain
/// an assignment to a variable defined in the case that owns that guard.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

void test1() {
  switch (42) {
    case var v when (v = 1) > 0:
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
      print(v);
      break;
    default:
  }
}

void test2() {
  var z = switch (42) {
    final int v when (v = 1) => 0 => v,
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => -1
  };
  print(z);
}

void test3() {
  if (42 case var v when (v = 1) > 0) {
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
    print(v);
  }
}

void test4() {
  List l = [
    1,
    if (42 case final int v when (v = 1) > 0) v else 1,
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
    3
  ];
  print(l);
}

main() {
  test1();
  test2();
  test3();
  test4();
}
