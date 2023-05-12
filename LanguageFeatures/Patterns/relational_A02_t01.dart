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
/// @description Checks a relational pattern in a switch statement
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

void test1(double value, String expected) {
  switch (value) {
    case < 0:
      Expect.equals("negative", expected);
      break;
    case == 0:
      Expect.equals("zero", expected);
      break;
    case > 0:
      Expect.equals("positive", expected);
      break;
    default:
      Expect.fail("One of the cases above should match");
  }
}

void test2(num value, String expected) {
  switch (value) {
    case != 0:
      Expect.equals("non-zero", expected);
      break;
    case == 0:
      Expect.equals("zero", expected);
      break;
    default:
      Expect.fail("One of the cases above should match");
  }
}

void test3(int value, String expected) {
  switch (value) {
    case >= 0:
      Expect.equals("zero or positive", expected);
      break;
    case <= -1:
      Expect.equals("negative", expected);
      break;
    default:
      Expect.fail("One of the cases above should match");
  }
}

main() {
  test1(-1.1, "negative");
  test1(42.42, "positive");
  test1(0, "zero");
  test2(3.14, "non-zero");
  test2(0, "zero");
  test3(0, "zero or positive");
  test3(-1, "negative");
  test3(-100, "negative");
  test3(1, "zero or positive");
  test3(42, "zero or positive");
}
