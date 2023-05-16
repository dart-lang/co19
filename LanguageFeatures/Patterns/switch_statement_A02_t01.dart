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
/// Many constant expressions are subsumed by the new pattern syntax so most
/// existing switch cases have the same semantics under this proposal. However,
/// patterns are not a strict superset of constant expressions and some switches
/// may be broken.
/// ...
/// List and map patterns. A list or map constant literal in a switch case is
/// now interpreted as a list or map pattern which destructures its elements at
/// runtime. Before, it was simply treated as identity comparison.
///
/// const a = 1;
/// const b = 2;
/// var obj = [1, 2]; // Not const.
///
/// switch (obj) {
///   case [a, b]: print("match"); break;
///   default: print("no match");
/// }
/// In Dart today, this prints "no match". With this proposal, it changes to
/// "match".
///
/// @description Checks that list and map patterns in a switch statement syntax
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

const a = 1;
const b = 2;

String testList(List<int> list) {
  switch (list) {
    case [a, b]:
      return "match";
    default:
      return "no match";
  }
}

String testMap(Map<String, int> map) {
  switch (map) {
    case {"key1": a, "key2": b}:
      return "match";
    default:
      return "no match";
  }
}

main() {
  var list = [1, 2];
  var map = {"key1": 1, "key2": 2};
  Expect.equals("match", testList(list));
  Expect.equals("match", testList([1, 2]));
  Expect.equals("match", testMap(map));
  Expect.equals("match", testMap({"key1": 1, "key2": 2}));
}
