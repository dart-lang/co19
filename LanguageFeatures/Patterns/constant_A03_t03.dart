// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion constantPattern ::= booleanLiteral
///                   | nullLiteral
///                   | '-'? numericLiteral
///                   | stringLiteral
///                   | symbolLiteral
///                   | identifier
///                   | qualifiedName
///                   | constObjectExpression
///                   | 'const' typeArguments? '[' elements? ']'
///                   | 'const' typeArguments? '{' elements? '}'
///                   | 'const' '(' expression ')'
///
/// A constant pattern determines if the matched value is equal to the
/// constant's value. We don't allow all expressions here because many
/// expression forms syntactically overlap other kinds of patterns. We avoid
/// ambiguity while supporting terse forms of the most common constant
/// expressions like so:
/// ...
/// List literals are ambiguous with list patterns, so we only allow list
/// literals explicitly marked const. Likewise with set and map literals versus
/// map patterns.
///
/// @description Check list, map and set literals in constant patterns. Test
/// switch expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String testList(List value) {
  return switch (value) {
    const [1, 2] => "[1, 2]",
    const [1, -2] => "[1, -2]",
    const ["3", "4"] => "['3', '4']",
    const [true, true] => "[true, true]",
    const [] => "[]",
    _ => "default"
  };
}

String testMap(Map value) {
  return switch (value) {
    const {1: 2} => "{1: 2}",
    const {'answer': -42} => "{'answer': -42}",
    const {'true': true} => "{'true': true}",
    const {} => "{}",
    _ => "default"
  };
}

String testSet(Set value) {
  return switch (value) {
    const ({1, 2, -3}) => "{1, 2, -3}",
    const ({'1', '2', '3'}) => "{'1', '2', '3'}",
    const (<dynamic>{}) => "{}",
    _ => "default"
  };
}

main() {
  Expect.equals("[1, 2]", testList(const [1, 2]));
  Expect.equals("[1, -2]", testList(const [1, -2]));
  Expect.equals("['3', '4']", testList(const ["3", "4"]));
  Expect.equals("[true, true]", testList(const [true, true]));
  Expect.equals("[]", testList(const []));
  Expect.equals("default", testList([1]));
  Expect.equals("default", testList([1, 2]));
  Expect.equals("default", testList([1, -2]));
  Expect.equals("default", testList(["3", "4"]));
  Expect.equals("default", testList([true, true]));
  Expect.equals("default", testList([]));

  Expect.equals("{1: 2}", testMap(const {1: 2}));
  Expect.equals("{'answer': -42}", testMap(const {'answer': -42}));
  Expect.equals("{'true': true}", testMap(const {'true': true}));
  Expect.equals("{}", testMap(const {}));
  Expect.equals("default", testMap({'x': 'y'}));
  Expect.equals("default", testMap({1: 2}));
  Expect.equals("default", testMap({'answer': -42}));
  Expect.equals("default", testMap({'true': true}));
  Expect.equals("default", testMap({}));

  Expect.equals("{1, 2, -3}", testSet(const {1, 2, -3}));
  Expect.equals("{'1', '2', '3'}", testSet(const {'1', '2', '3'}));
  Expect.equals("{}", testSet(const {}));
  Expect.equals("default", testSet({1}));
  Expect.equals("default", testSet({1, 2, -3}));
  Expect.equals("default", testSet({'1', '2', '3'}));
  Expect.equals("default", testSet({}));
}
