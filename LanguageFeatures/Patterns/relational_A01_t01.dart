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
/// @description Checks a relational pattern in a switch expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(num num) {
  return switch (num) {
    case < 0 => "negative";
    case == 0 => "zero";
    case > 0 => "positive";
    default => "Impossible!";
  };
}

String test2(double num) {
  return switch (num) {
    case != 0 => "non-zero";
    case == 0 => "zero";
    default => "Impossible!";
  };
}

String test3(int num) {
  return switch (num) {
    case >= 1 => "positive";
    case <= 0 => "zero or negative";
    default => "Impossible!";
  };
}

main() {
  Expect.equals("negative", test1(-1.1));
  Expect.equals("positive", test1(42));
  Expect.equals("zero", test1(0));
  Expect.equals("non-zero", test2(3.14));
  Expect.equals("zero", test2(0));
  Expect.equals("zero or negative", test3(0));
  Expect.equals("zero or negative", test3(-1));
  Expect.equals("positive", test3(1));
  Expect.equals("positive", test3(42));
}
