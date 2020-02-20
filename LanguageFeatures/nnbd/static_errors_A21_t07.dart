/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error for a variable to be declared as late in any of the
 * following positions: in a formal parameter list of any kind; in a catch
 * clause; in the variable binding section of a c-style for loop, a for in loop,
 * an await for loop, or a for element in a collection literal.
 *
 * @description Check that it is an error if variable declared late in for
 * element in a collection literal
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
main() async {
  List list = [1, 2, 3, 4];
  <int> [
    1, 2, 3,
    for (late var i in list) i,
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  3, 2, 1
  ];

  <int>{
    1, 2, 3,
    for (late var i in list) i,
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    3, 2, 1
  };

  <int, int>{
    21: 21, 22: 22, 23: 23,
    for (late var i in list) i: i,
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    13: 13, 12: 12, 11: 11
  };
}
