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
/// @description Checks that it is a compile-time error if a guard clause
/// contains a wildcard
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

String test(int value) {
  switch (value) {
    case var _ && 0 || var _ && 1 when _ == 0:
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
      return "logical-or-1";
    case 1 || 2:
      return "logical-or-2";
    case var _ && > 10 && var _ && < 15 when _ == 14:
//                                           ^
// [analyzer] unspecified
// [cfe] unspecified
      return "logical-and-1";
    case < 25 when _:
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
      return "relational-1";
    case (var _ && 40) when _ == 42:
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
      return "parenthesized-1";
    default:
      return "default";
  }
}

String testCast(num value) {
  switch (value) {
    case var _ as int when _ == 42:
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
      return "cast-1";
    default:
      return "default";
  }
}

String testNullCheck(int? value) {
  switch (value) {
    case var _? when _ > 0:
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
      return "null-check-1";
    default:
      return "default";
  }
}

String testNullAssert(int? value) {
  switch (value) {
    case var _! when _ > 0:
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
      return "null-assert-1";
    default:
      return "default";
  }
}

String testVariable(int value) {
  switch (value) {
    case var _ when _ > 0:
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
      return "variable-1";
    default:
      return "default";
  }
}

String testList(List<int> list) {
  switch (list) {
    case [1, var _] when _ > 0:
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
      return "list-1";
    default:
      return "default";
  }
}

String testMap(Map<String, int> map) {
  switch (map) {
    case {"key1": 1, "key2": var _} when _ > 0:
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
      return "map-1";
    default:
      return "default";
  }
}

String testRecord((int, int) record) {
  switch (record) {
    case (1, var _) when _ > 0:
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
      return "record-1";
    default:
      return "default";
  }
}

String testObject(Shape shape) {
  switch (shape) {
    case Square(sizeAsInt: var _) when _ > 2:
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
      return "object-1";
    default:
      return "default";
  }
}

main() {
  test(0);
  testCast(42);
  testNullCheck(0);
  testNullAssert(1);
  testVariable(1);
  testList([1, 2]);
  testMap({"key1": 1, "key2": 2});
  testRecord((1, 2));
  testObject(Square(3));
}
