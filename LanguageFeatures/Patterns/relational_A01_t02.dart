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
/// @description Checks a relational subpattern in a switch expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test(List<num> list) => switch (list) {
  [> -1 && <= 2] => "case 1",
  [== 42] => "case 2",
  [>= 10 && < 20] => "case 3",
  [!= 100] => "case 4",
  _ => "default"
};

main() {
  Expect.equals("case 1", test([0]));
  Expect.equals("case 1", test([1.1]));
  Expect.equals("case 1", test([2]));
  Expect.equals("case 2", test([42]));
  Expect.equals("case 3", test([10]));
  Expect.equals("case 3", test([11.1]));
  Expect.equals("case 4", test([20]));
  Expect.equals("default", test([100]));
}
