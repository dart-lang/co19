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
/// @description Checks that a variable defined in a guard expression is visible
/// in its case scope
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

int test1() {
  switch (42) {
    case var v when (var z = 1) > 0:
      z.isOdd;
      return z;
    default:
      return -1;
  }
}

int test2() {
  return switch (42) {
    final int v when (final z = 1) => 0 => z,
    _ => -1
  };
}

int test3() {
  if (42 case var v when (final int z = 1) > 0) {
    z.isOdd;
    return z;
  }
  return -1;
}

List<int> test4() {
  return [
    1,
    if (42 case final int v when (var z = 2) > 0) z,
    3
  ];
}


main() {
  Expect.equals(1, test1());
  Expect.equals(1, test2());
  Expect.equals(1, test3());
  Expect.listEquals([1, 2, 3], test4());
}
