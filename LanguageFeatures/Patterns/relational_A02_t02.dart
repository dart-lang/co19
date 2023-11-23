// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion relationalPattern ::=
///   ( equalityOperator | relationalOperator) relationalExpression
///
/// A relational pattern lets you compare the matched value to a given constant
/// using any of the equality or relational operators: ==, !=, <, >, <=, and >=.
/// The pattern matches when calling the appropriate operator on the matched
/// value with the constant as an argument returns true. It is a compile-time
/// error if relationalExpression is not a valid constant expression.
///
/// @description Checks a relational subpattern in a switch statement
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

void test(List<num> list, String expected) {
  switch (list) {
    case [> -1 && <= 2]:
      Expect.equals("case 1", expected);
      break;
    case [== 42]:
      Expect.equals("case 2", expected);
      break;
    case [>= 10 && < 20]:
      Expect.equals("case 3", expected);
      break;
    case [!= 100]:
      Expect.equals("case 4", expected);
      break;
    default:
      Expect.equals("default", expected);
  }
}

main() {
  test([0], "case 1");
  test([1], "case 1");
  test([2], "case 1");
  test([42], "case 2");
  test([10], "case 3");
  test([10.1], "case 3");
  test([20], "case 4");
  test([100], "default");
}
