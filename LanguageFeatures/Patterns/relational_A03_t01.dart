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
/// @description Checks a relational pattern in a if-case statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

void test1(double value, String expected) {
  if (value case < 0) {
    Expect.equals("negative", expected);
  } else if (value case == 0) {
    Expect.equals("zero", expected);
  } else if (value case > 0) {
    Expect.equals("positive", expected);
  } else {
    Expect.fail("One of the cases above should match");
  }
}

void test2(num value, String expected) {
  if (value case != 0) {
    Expect.equals("non-zero", expected);
  } else if (value case == 0) {
    Expect.equals("zero", expected);
  } else {
    Expect.fail("One of the cases above should match");
  }
}

void test3(int value, String expected) {
  if (value case >= 1) {
    Expect.equals("positive", expected);
  } else if (value case <= 0) {
    Expect.equals("zero or negative", expected);
  } else {
    Expect.fail("One of the cases above should match");
  }
}

main() {
  test1(-1.1, "negative");
  test1(42.42, "positive");
  test1(0, "zero");
  test2(3.14, "non-zero");
  test2(0, "zero");
  test3(0, "zero or negative");
  test3(-100, "zero or negative");
  test3(1, "positive");
  test3(42, "positive");
}
