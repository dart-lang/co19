// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We extend switch statements to allow patterns in cases:
///
/// switchStatement         ::= 'switch' '(' expression ')'
///                         '{' switchStatementCase* switchStatementDefault? '}'
/// switchStatementCase     ::= label* 'case' guardedPattern ':' statements
/// guardedPattern          ::= pattern ( 'when' expression )?
/// switchStatementDefault  ::= label* 'default' ':' statements
/// ...
/// We also allow an optional guard clause to appear after a case. This enables
/// a switch case to evaluate an arbitrary predicate after matching.
///
/// @description Checks that a guard expression is evaluated after matching.
/// Test the case when there is a constant named _ and a guarded pattern
/// contains a wildcard
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

const _ = 42;

String test(int value) {
  switch (value) {
    case var _ && 0 || var _ && 1 when _ == 0:
      return "logical-or-1";
    case var _ && 0 || var _ && 1 when _ == 42:
      return "logical-or-2";
    case var _ && > 10 && var _ && < 15 when _ == 14:
      return "logical-and-1";
    case var _ && > 10 && var _ && < 15 when _ == 42:
      return "logical-and-2";
    case < 25 when _ == 24:
      return "relational-1";
    case <= 25 when _ == 42:
      return "relational-2";
    case 30 when _ == 0:
      return "constant-1";
    case 30 when _ == 42:
      return "constant-2";
    case (var _ && 40) when _ == 0:
      return "parenthesized-1";
    case (var _ && 40) when _ == 42:
      return "parenthesized-2";
    default:
      return "default";
  }
}

String testCast(num value) {
  switch (value) {
    case var _ as int when _ == 0:
      return "cast-1";
    case var _ as double when _ == 42:
      return "cast-2";
    default:
      return "default";
  }
}

String testNullCheck(int? value) {
  switch (value) {
    case var _? when _ == 0:
      return "null-check-1";
    case var _? when _ == 42:
      return "null-check-2";
    default:
      return "default";
  }
}

String testNullAssert(int? value) {
  switch (value) {
    case var _! when _ == 0:
      return "null-assert-1";
      case var _! when _ == 42:
      return "null-assert-2";
    default:
      return "default";
  }
}

String testVariable(int value) {
  switch (value) {
    case var _ when _ == 0:
      return "variable-1";
    case var _ when _ == 42:
      return "variable-2";
    default:
      return "default";
  }
}

String testList(List<int> list) {
  switch (list) {
    case [1, var _] when _ == 0:
      return "list-1";
    case [1, final _] when _ == 42:
      return "list-2";
    case [2, ..._] when _ == 0:
      return "list-3";
    case [2, ..._] when _ == 42:
      return "list-4";
    default:
      return "default";
  }
}

String testMap(Map<String, int> map) {
  switch (map) {
    case {"key1": 1, "key2": var _} when _ == 0:
      return "map-1";
    case {"key1": 1, "key2": final _} when _ == 42:
      return "map-2";
    default:
      return "default";
  }
}

String testRecord(Record record) {
  switch (record) {
    case (1, var _) when _ == 0:
      return "record-1";
    case (1, final _) when _ == 42:
      return "record-2";
    case (1, n: var _) when _ == 0:
      return "record-3";
    case (1, n: final _) when _ == 42:
      return "record-4";
    default:
      return "default";
  }
}

String testObject(Shape shape) {
  switch (shape) {
    case Square(sizeAsInt: var _) when _ == 0:
      return "object-1";
    case Square(areaAsInt: final _) when _ == 42:
      return "object-2";
    default:
      return "default";
  }
}

main() {
  Expect.equals("logical-or-2", test(0));
  Expect.equals("logical-and-2", test(14));
  Expect.equals("relational-2", test(24));
  Expect.equals("constant-2", test(30));
  Expect.equals("parenthesized-2", test(40));
  Expect.equals("cast-2", testCast(0));
  Expect.equals("null-check-2", testNullCheck(0));
  Expect.equals("default", testNullCheck(null));
  Expect.equals("null-assert-2", testNullAssert(0));
  Expect.throws(() {testNullAssert(null);});
  Expect.equals("variable-2", testVariable(0));
  Expect.equals("list-2", testList([1, 0]));
  Expect.equals("list-4", testList([2, 0]));
  Expect.equals("map-2", testMap({"key1": 1, "key2": 0}));
  Expect.equals("record-2", testRecord((1, 0)));
  Expect.equals("record-4", testRecord((1, n: 0)));
  Expect.equals("object-2", testObject(Square(0)));
}
