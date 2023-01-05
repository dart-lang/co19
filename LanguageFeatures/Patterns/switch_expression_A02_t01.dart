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
/// @description Checks a switch expression with different subpatterns and a
/// guard expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String test(int value) =>
  switch (value) {
    var a1 && 0 || var a1 && 1 when a1 == 0 => "logical-or-1",
    1 || 2 => "logical-or-2",
    var a2 && > 10 && var b2 && < 15 when a2 == 14 => "logical-and-1",
    > 12 && < 17 => "logical-and-2",
    < 25 when false => "relational-1",
    <= 25 when true => "relational-2",
    30 when 1 > 2 => "constant-1",
    30 when 1 < 2 => "constant-2",
    (var a3 && 40) when a3 == 42 => "parenthesized-1",
    (40) => "parenthesized-2",
    _ => "default"
  };

String testCast(num value) =>
  switch (value) {
    var c1 as int when c1 == 42 => "cast-1 =$c1",
    var c2 as double when c2 > 4 => "cast-2 =${c2.toStringAsFixed(2)}",
    _ => "default"
  };

String testNullCheck(int? value) =>
  switch (value) {
    var a1? when a1 > 0 => "null-check-1",
    var a2? => "null-check-2",
    _ => "default"
  };

String testNullAssert(int? value) {
  switch (value) {
    var a1! when a1 > 0 => "null-assert-1",
    var a2! => "null-assert-2",
    _ => "default"
  };

String testVariable(int value) =>
  switch (value) {
    var a1 when a1 > 0 => "variable-1",
    var a2 when a2 < 0 => "variable-2",
    _ => "default"
  };

String testList(List<int> list) =>
  switch (list) {
    [1, var a] when a > 0 => "list-1",
    [1, final b, ...] when b < 0 => "list-2",
    [1, _, ...r] when !r.isEmpty => "list-3",
    _ => "default"
  };

String testMap(Map<String, int> map) {
  switch (map) {
    {"key1": 1, "key2": var a} when a > 0 => "map-1",
    {"key1": 1, "key2": final b} when b < 0 => "map-2",
    _ => "default"
  };

String testRecord(Record record) {
  switch (record) {
    (1, var a) when a > 0 => "record-1",
    (1, final b) when b < 0 => "record-2",
    (1, 2, n: var c) when c > 0 => "record-3",
    (1, 2, n: final d) when d < 0 => "record-4",
    _ => "default"
  };

String testObject(Shape shape) =>
  switch (shape) {
    Square(sizeAsInt: var a) when a > 2 => "object-1",
    Square(areaAsInt: final b) when b < 4 => "object-2",
    Circle(sizeAsInt: var c) when c > 1 => "object-3",
    Circle(sizeAsInt: final d) when d < 1 => "object-4",
    _ => "default"
  };

main() {
  Expect.equals("logical-or-1", test(0));
  Expect.equals("logical-or-2", test(1));
  Expect.equals("logical-and-1", test(14));
  Expect.equals("logical-and-2", test(13));
  Expect.equals("default", test(24));
  Expect.equals("relational-2", test(23));
  Expect.equals("constant-2", test(30));
  Expect.equals("parenthesized-2", test(40));
  Expect.equals("default", test(100));

  Expect.equals("cast-1 =42", testCast(42));
  Expect.equals("cast-2 =41.00", testCast(41));
  Expect.equals("default", testCast(3));

  Expect.equals("null-check-2", testNullCheck(0));
  Expect.equals("null-check-1", testNullCheck(1));
  Expect.equals("default", testNullCheck(null));

  Expect.equals("null-assert-1", testNullAssert(1));
  Expect.equals("null-assert-2", testNullAssert(0));
  Expect.throws(() {testNullAssert(null);});

  Expect.equals("variable-1", testVariable(1));
  Expect.equals("variable-2", testVariable(-1));
  Expect.equals("default", testVariable(0));

  Expect.equals("list-1", testList([1, 2]));
  Expect.equals("list-2", testList([1, -1]));
  Expect.equals("list-3", testList([1, 0, 3]));
  Expect.equals("default", testList([1, 0]));

  Expect.equals("map-1", testMap({"key1": 1, "key2": 2}));
  Expect.equals("map-2", testMap({"key1": 1, "key2": -3}));
  Expect.equals("default", testMap({"key1": 1, "key2": 0}));

  Expect.equals("record-1", testRecord((1, 2)));
  Expect.equals("record-2", testRecord((1, -3)));
  Expect.equals("record-3", testRecord((1, 2, n: 3)));
  Expect.equals("record-4", testRecord((1, 2, n: -4)));
  Expect.equals("default", testRecord((1, 0)));
  Expect.equals("default", testRecord((1, 2, n: 0)));

  Expect.equals("object-1", testObject(Square(3)));
  Expect.equals("object-2", testObject(Square(1)));
  Expect.equals("default", testObject(Square(0)));
  Expect.equals("object-3", testObject(Circle(2)));
  Expect.equals("object-4", testObject(Circle(0.5)));
  Expect.equals("default", testObject(Circle(1)));
}
