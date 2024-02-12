// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion relationalPattern ::=
///   ( equalityOperator | relationalOperator) bitwiseOrExpression
///
/// A relational pattern lets you compare the matched value to a given constant
/// using any of the equality or relational operators: ==, !=, <, >, <=, and >=.
/// The pattern matches when calling the appropriate operator on the matched
/// value with the constant as an argument returns true.
///
/// It is a compile-time error if bitwiseOrExpression is not a valid constant
/// expression.
///
/// @description Checks a relational pattern in a switch expression
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String test1(num num) {
  return switch (num) {
    < 0 => "negative",
    == 0 => "zero",
    > 0 => "positive",
    _ => "Impossible!"
  };
}

String test2(double num) {
  return switch (num) {
    != 0 => "non-zero",
    == 0 => "zero",
    _ => "Impossible!"
  };
}

String test3(int num) {
  return switch (num) {
    >= 0 => "zero or positive",
    <= -1 => "negative",
    _ => "Impossible!"
  };
}

main() {
  Expect.equals("negative", test1(-1.1));
  Expect.equals("positive", test1(42));
  Expect.equals("zero", test1(0));
  Expect.equals("non-zero", test2(3.14));
  Expect.equals("zero", test2(0));
  Expect.equals("zero or positive", test3(0));
  Expect.equals("negative", test3(-1));
  Expect.equals("negative", test3(-2));
  Expect.equals("zero or positive", test3(1));
  Expect.equals("zero or positive", test3(42));
}
