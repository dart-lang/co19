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
/// in constant patterns. Test switch expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String testList(List value) {
  return switch (value) {
    const <int>[1, -2] => "<int>[1, -2]",
    const <dynamic>[1, -2] => "<dynamic>[1, -2]",
    const <String>["3", "4"] => "<String>['3', '4']",
    const <dynamic>["3", "4"] => "<dynamic>['3', '4']",
    const <double>[] => "<double>[]",
    const <dynamic>[] => "<dynamic>[]",
    _ => "default"
  };
}

String testMap(Map value) {
  return switch (value) {
    const <int, int>{1: -2} => "<int, int>{1: -2}",
    const <dynamic, dynamic>{1: -2} => "<dynamic, dynamic>{1: -2}",
    const <String, num>{'answer': 42} => "<String, num>{'answer': 42}",
    const <dynamic, dynamic>{'answer': 42} =>
      "<dynamic, dynamic>{'answer': 42}",
    const <String, Object>{'true': true} => "<String, Object>{'true': true}",
    const <dynamic, dynamic>{'true': true} =>
      "<dynamic, dynamic>{'true': true}",
    const <String, int>{} => "<String, int>{}",
    const <dynamic, dynamic>{} => "<dynamic, dynamic>{}",
    _ => "default"
  };
}

String testSet(Set value) {
  return switch (value) {
    const (<num>{1, 2, -3}) => "<num>{1, 2, -3}",
    const (<dynamic>{1, 2, -3}) => "<dynamic>{1, 2, -3}",
    const (<String>{'1', '2', '3'}) => "<String>{'1', '2', '3'}",
    const (<dynamic>{'1', '2', '3'}) => "<dynamic>{'1', '2', '3'}",
    const (<double>{}) => "<double>{}",
    const (<dynamic>{}) => "<dynamic>{}",
    _ => "default"
  };
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
