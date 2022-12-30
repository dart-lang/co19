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
/// @description Checks a switch expressions can be used as operands of postfix
/// operators
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

int foo() => 42;
int bar() => 0;

List<int> l1 = [42];
List<int> l2 = [0];

int test1(String s) =>
  switch (s) {
    "foo" => foo,
    _ => bar
  }();

int test2(String s) =>
  switch (s) {
    "l1" => l1,
    _ => l2
  }[0];

bool test3(String s) =>
  switch (s) {
    "one" => 1,
    "two" => 2,
    _ => 0
  }.isEven;

bool? test4(String s) =>
  switch (s) {
    "one" => 1,
    "two" => 2,
    _ => null
  }?.isEven;

int test5(String s) =>
  switch (s) {
    "one" => 1,
    "two" => 2,
    _ => 0
  }++;

int test6(String s) =>
  switch (s) {
    "one" => 1,
    "two" => 2,
    _ => 0
  }--;

main() {
  Expect.equals(42, test1("foo"));
  Expect.equals(0, test1("bar"));
  Expect.equals(42, test2("l1"));
  Expect.equals(0, test2("l2"));
  Expect.isFalse(test3("one"));
  Expect.isTrue(test3("two"));
  Expect.isFalse(tes4("one"));
  Expect.isTrue(test4("two"));
  Expect.isNull(test4("zero"));
  Expect.equals(1, test5("one"));
  Expect.equals(2, test5("two"));
  Expect.equals(0, test5("zero"));
  Expect.equals(1, test6("one"));
  Expect.equals(2, test6("two"));
  Expect.equals(0, test6("zero"));
}
