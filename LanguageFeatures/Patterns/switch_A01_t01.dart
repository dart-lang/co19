// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We extend switch statements to allow patterns in cases:
///
/// switchStatement         ::= 'switch' '(' expression ')'
///                             '{' switchStatementCase* switchStatementDefault? '}'
/// switchStatementCase     ::= label* 'case' guardedPattern ':' statements
/// guardedPattern          ::= pattern ( 'when' expression )?
/// switchStatementDefault  ::= label* 'default' ':' statements
/// Allowing patterns in cases significantly increases the expressiveness of
/// what properties a case can verify, including executing arbitrary
/// user-defined code. This implies that the order that cases are checked is now
/// potentially user-visible and an implementation must execute the first case
/// that matches.
///
/// @description Checks that the first case that matches is executed first
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String test(int value) {
  switch (value) {
    case 0 || 1:
      return "logical-or-1";
    case 1 || 2:
      return "logical-or-2";
    case > 10 && < 15:
      return "logical-and-1";
    case > 12 && < 17:
      return "logical-and-2";
    case < 25:
      return "relational-1";
    case <= 25:
      return "relational-2";
    case 30:
      return "constant-1";
    case 30:
      return "constant-2";
    case (40):
      return "parenthesized-1";
    case (40):
      return "parenthesized-2";
    default:
      return "default";
  }
}

String testCast(num value) {
  switch (value) {
    case var c1 as double:
      return "cast-1";
    case var c2 as double:
      return "cast-2";
    default:
      return "default";
  }
}

String testNullCheck(int? value) {
  switch (value) {
    case var a1?:
      return "null-check-1";
    case var a2?:
      return "null-check-2";
    default:
      return "default";
  }
}

String testNullAssert(int? value) {
  switch (value) {
    case var a1!:
      return "null-assert-1";
    case var a2!:
      return "null-assert-2";
    default:
      return "default";
  }
}

String testVariable(int value) {
  switch (value) {
    case var a1:
      return "variable-1";
    case var a2:
      return "variable-2";
    default:
      return "default";
  }
}

String testList(List<int> list) {
  switch (list) {
    case [1, 2]:
      return "list-1";
    case [1, _]:
      return "list-2";
    case [1, 2, ...]:
      return "list-3";
    case [1, 2, 3]:
      return "list-4";
    default:
      return "default";
  }
}

String testMap(Map<String, int> map) {
  switch (map) {
    case {"key1:" 1, "key2": 2}:
      return "map-1";
    case {"key1:" 1, "key2": _}:
      return "map-2";
    case {"key1:" 1, "key2": 2, ...}:
      return "map-3";
    case {"key1:" 1, "key2": 2, "key3": 3}:
      return "map-4";
    default:
      return "default";
  }
}

String testRecord(Record record) {
  switch (record) {
    case (1, 2):
      return "record-1";
    case (1, _):
      return "record-2";
    case (1, 2, n: 3):
      return "record-3";
    case (1, 2, n: _):
      return "record-4";
    default:
      return "default";
  }
}

String testObject(Shape shape) {
  switch (shape) {
    case Square(sizeAsInt: 1):
      return "object-1";
    case Square(areaAsInt: 1):
      return "object-2";
    case Circle(sizeAsInt: _):
      return "object-3";
    case Circle(sizeAsInt: 1):
      return "object-4";
    default:
      return "default";
  }
}

main() {
  Expect.equals("logical-or-1", test(1));
  Expect.equals("logical-or-2", test(2));
  Expect.equals("logical-and-1", test(13));
  Expect.equals("logical-and-2", test(16));
  Expect.equals("relational-1", test(21));
  Expect.equals("relational-2", test(25));
  Expect.equals("constant-1", test(30));
  Expect.equals("parenthesized-1", test(40));

  Expect.equals("cast-1", testCast(3.14));
  Expect.equals("null-check-1", testNullCheck(0));
  Expect.equals("default", testNullCheck(null));
  Expect.equals("null-assert-1", testNullAssert(1));
  Expect.throws(() {testNullAssert(null);});
  Expect.equals("variable-1", testVariable(1));
  Expect.equals("list-1", testList([1, 2]));
  Expect.equals("list-2", testList([1, 3]));
  Expect.equals("list-3", testList([1, 2, 3]));
  Expect.equals("map-1", testMap({"key1:" 1, "key2": 2}));
  Expect.equals("map-2", testMap({"key1:" 1, "key2": 3}));
  Expect.equals("map-3", testMap({"key1:" 1, "key2": 2, "key3": 3}));
  Expect.equals("record-1", testRecord((1, 2)));
  Expect.equals("record-2", testRecord((1, 3)));
  Expect.equals("record-3", testRecord((1, 2, n: 3)));
  Expect.equals("record-4", testRecord((1, 2, n: 4)));
  Expect.equals("object-1", testObject(Square(1)));
  Expect.equals("object-3", test(Circle(1)));
  Expect.equals("object-3", test(Circle(2)));
}
