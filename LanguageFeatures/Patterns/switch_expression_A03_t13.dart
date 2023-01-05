// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// primary                 ::= // Existing productions...
///                           | switchExpression
///
/// switchExpression      ::= 'switch' '(' expression ')' '{'
///                           switchExpressionCase ( ',' switchExpressionCase )*
///                           ','? '}'
/// switchExpressionCase  ::= guardedPattern '=>' expression
///
/// The body is a series of cases. Each case has a pattern, optional guard, and
/// a single expression body. As with other expression forms containing a list
/// of subelements (argument lists, collection literals), the cases are
/// separated by commas with an optional trailing comma. Since the body of each
/// case is a single expression with a known terminator, it's easy to tell when
/// one case ends and the next begins. That lets us do away with the case
/// keyword.
///
/// To keep the syntax small and light, we also disallow a default clause.
/// Instead, you can use a shorter _ wildcard pattern to catch any remaining
/// values.
///
/// Slotting into primary means it can be used anywhere any expression can
/// appear, even as operands to unary and binary operators. Many of these uses
/// are ugly, but not any more problematic than using a collection literal in
/// the same context since a switch expression is always delimited by a switch
/// and }.
///
/// @description Checks that a switch expression can be used as operand of
/// assignment operator
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

main() {
  var x = switch("one") {
    "one" => 1,
    _ => 0;
  };
  Expect.equals(1, x);

  x += switch("one") {
    "one" => 1,
    _ => 0;
  };
  Expect.equals(2, x);

  x *= switch("two") {
    "two" => 2,
    _ => 0;
  };
  Expect.equals(4, x);

  x -= switch("one") {
    "one" => 1,
    _ => 0;
  };
  Expect.equals(3, x);

  x &= switch("two") {
    "two" => 2,
    _ => 0;
  };
  Expect.equals(2, x);

  x ^= switch("one") {
    "one" => 1,
    _ => 0;
  };
  Expect.equals(3, x);

  x %= switch("two") {
    "two" => 1,
    _ => 0;
  };
  Expect.equals(1, x);

  x ~/= switch("two") {
    "two" => 1,
    _ => 0;
  };
  Expect.equals(0, x);

  double y = 4;
  y /= switch("two") {
    "two" => 2,
    _ => 0;
  };
  Expect.equals(2, y);
}
