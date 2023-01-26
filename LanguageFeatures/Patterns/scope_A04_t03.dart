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
/// @description Checks that a variable declared in a case pattern can be used
/// in a guard expression and initialized by that time
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(int x) {
  switch (x) {
    case var v1 when v1 > 0:
      return "case-1";
    case var v2 when v2 <= 0:
      return "case-2";
    default:
      return "default";
  }
}

String test2(int x) =>
  switch (x) {
    var v1 when v1 > 0 => "case-1",
    var v2 when v2 <= 0 => "case-2",
    _ => "default"
  };

String test3(int x) {
  if (x case var v1 when v1 > 0) {
    return "case-1";
  }
  if (x case var v2 when v2 <= 0) {
    return "case-2";
  }
  return "default";
}

List<int> test4(int x) {
  return [
    1,
    if (x case final int v when v > 0) v,
    3
  ];
}


main() {
  Expect.equals("case-1", test1(1));
  Expect.equals("case-2", test1(0));
  Expect.equals("case-1", test2(1));
  Expect.equals("case-2", test2(0));
  Expect.equals("case-1", test3(1));
  Expect.equals("case-2", test3(0));
  Expect.listEquals([1, 2, 3], test4(2));
  Expect.listEquals([1, 3], test4(0));
}
