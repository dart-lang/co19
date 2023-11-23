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
/// @description Check list, map and set literals with type argument specified
/// in constant patterns. Test switch statement
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String testList(List value) {
  switch (value) {
    case const <int>[1, -2]:
      return "<int>[1, -2]";
    case const <dynamic>[1, -2]:
      return "<dynamic>[1, -2]";
    case const <String>["3", "4"]:
      return "<String>['3', '4']";
    case const <dynamic>["3", "4"]:
      return "<dynamic>['3', '4']";
    case const <double>[]:
      return "<double>[]";
    case const <dynamic>[]:
      return "<dynamic>[]";
    default:
      return "default";
  }
}

String testMap(Map value) {
  switch (value) {
    case const <int, int>{1: -2}:
      return "<int, int>{1: -2}";
    case const <dynamic, dynamic>{1: -2}:
      return "<dynamic, dynamic>{1: -2}";
    case const <String, num>{'answer': 42}:
      return "<String, num>{'answer': 42}";
    case const <dynamic, dynamic>{'answer': 42}:
      return "<dynamic, dynamic>{'answer': 42}";
    case const <String, Object>{'true': true}:
      return "<String, Object>{'true': true}";
    case const <dynamic, dynamic>{'true': true}:
      return "<dynamic, dynamic>{'true': true}";
    case const <String, int>{}:
      return "<String, int>{}";
    case const <dynamic, dynamic>{}:
      return "<dynamic, dynamic>{}";
    default:
      return "default";
  }
}

String testSet(Set value) {
  switch (value) {
    case const (<num>{1, 2, -3}):
      return "<num>{1, 2, -3}";
    case const (<dynamic>{1, 2, -3}):
      return "<dynamic>{1, 2, -3}";
    case const (<String>{'1', '2', '3'}):
      return "<String>{'1', '2', '3'}";
    case const (<dynamic>{'1', '2', '3'}):
      return "<dynamic>{'1', '2', '3'}";
    case const (<double>{}):
      return "<double>{}";
    case const (<dynamic>{}):
      return "<dynamic>{}";
    default:
      return "default";
  }
}

main() {
  Expect.equals("<dynamic>[1, -2]", testList(const [1, -2]));
  Expect.equals("<int>[1, -2]", testList(const <int>[1, -2]));
  Expect.equals("default", testList([1, -2]));
  Expect.equals("default", testList(const <num>[1, -2]));
  Expect.equals("default", testList(const <Object>[1, -2]));
  Expect.equals("<dynamic>['3', '4']", testList(const ["3", "4"]));
  Expect.equals("<String>['3', '4']", testList(const <String>["3", "4"]));
  Expect.equals("default", testList(["3", "4"]));
  Expect.equals("default", testList(const <Object>["3", "4"]));
  Expect.equals("<double>[]", testList(const <double>[]));
  Expect.equals("<dynamic>[]", testList(const []));
  Expect.equals("default", testList(const <num>[]));
  Expect.equals("default", testList(const <Object>[]));

  Expect.equals("<dynamic, dynamic>{1: -2}", testMap(const {1: -2}));
  Expect.equals("<int, int>{1: -2}", testMap(const <int, int>{1: -2}));
  Expect.equals("default", testMap({1: -2}));
  Expect.equals("default", testMap(const <num, num>{1: -2}));
  Expect.equals("<dynamic, dynamic>{'answer': 42}",
      testMap(const {'answer': 42}));
  Expect.equals("<String, num>{'answer': 42}",
      testMap(const <String, num>{'answer': 42}));
  Expect.equals("default", testMap(const <Object, int>{'answer': 42}));
  Expect.equals("<dynamic, dynamic>{'true': true}",
      testMap(const {'true': true}));
  Expect.equals("<String, Object>{'true': true}",
      testMap(const <String, Object>{'true': true}));
  Expect.equals("<String, int>{}", testMap(const <String, int>{}));
  Expect.equals("<dynamic, dynamic>{}", testMap(const {}));
  Expect.equals("default", testMap(const {'x': 'y'}));

  Expect.equals("<num>{1, 2, -3}", testSet(const <num>{1, 2, -3}));
  Expect.equals("default", testSet(<num>{1, 2, -3}));
  Expect.equals("<dynamic>{1, 2, -3}", testSet(const {1, 2, -3}));
  Expect.equals("<dynamic>{'1', '2', '3'}", testSet(const {'1', '2', '3'}));
  Expect.equals("<String>{'1', '2', '3'}",
      testSet(const <String>{'1', '2', '3'}));
  Expect.equals("default", testSet(const <Object>{'1', '2', '3'}));
  Expect.equals("default", testSet(<Object>{'1', '2', '3'}));
  Expect.equals("<double>{}", testSet(const <double>{}));
  Expect.equals("<dynamic>{}", testSet(const {}));
  Expect.equals("default", testSet(<double>{}));
  Expect.equals("default", testSet(const {1}));
}
