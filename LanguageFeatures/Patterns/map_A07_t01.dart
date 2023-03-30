// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// mapPattern        ::= typeArguments? '{' mapPatternEntries? '}'
/// mapPatternEntries ::= mapPatternEntry ( ',' mapPatternEntry )* ','?
/// mapPatternEntry   ::= expression ':' pattern
///
/// A map pattern matches values that implement Map and accesses values by key
/// from it.
/// It is a compile-time error if:
/// - typeArguments is present and there are more or fewer than two type
///   arguments.
/// - Any of the entry key expressions are not constant expressions.
///
/// @description Check that if a map has more elements than number of
/// subpatterns in a map pattern then match may happen
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(Map map) {
  return switch (map) {
    {1: 1, 2: > 0} => "case-1",
    {1: 2, 2: <= 0} => "case-2",
    {1: 3, 2: var a} => "case-3",
    _ => "default"
  };
}

String test2(Map map) {
  switch (map) {
    case {1: 1, 2: > 0}:
      return "case-1";
    case {1: 2, 2: <= 0}:
      return "case-2";
    case {1: 3, 2: var a}:
      return "case-3";
    default:
      return "default";
  }
}

String test3(Map map) {
  if (map case {1: 1, 2: > 0}) {
    return "case-1";
  }
  if (map case {1: 2, 2: <= 0}) {
    return "case-2";
  }
  if (map case {1: 3, 2: var a}) {
    return "case-3";
  }
  return "default";
}

main() {
  var {1: a, 2: b} = {1: 1, 2: 2, 3: 3};
  Expect.equals(1, a);
  Expect.equals(2, b);

  final {1: _, 2: int c} = {1: 2, 2: 2, 3: 3};
  Expect.equals(2, c);

  var {1: _, 2: _} = {1: 3, 2: 2, 3: 3};

  Expect.equals("case-1", test1({1: 1, 2: 1}));
  Expect.equals("case-1", test1({1: 1, 2: 2, 3: 3}));
  Expect.equals("default", test1({1: 1}));
  Expect.equals("case-2", test1({1: 2, 2: 0}));
  Expect.equals("case-2", test1({1: 2, 2: -1, 3: 3}));
  Expect.equals("default", test1({2: 0}));
  Expect.equals("case-3", test1({1: 3, 2: 0}));
  Expect.equals("case-3", test1({1: 3, 2: -1, 3: 3}));
  Expect.equals("default", test1({1: 3}));

  Expect.equals("case-1", test2({1: 1, 2: 1}));
  Expect.equals("case-1", test2({1: 1, 2: 2, 3: 3}));
  Expect.equals("default", test2({1: 1}));
  Expect.equals("case-2", test2({1: 2, 2: 0}));
  Expect.equals("case-2", test2({1: 2, 2: -1, 3: 3}));
  Expect.equals("default", test2({2: 0}));
  Expect.equals("case-3", test2({1: 3, 2: 0}));
  Expect.equals("case-3", test2({1: 3, 2: -1, 3: 3}));
  Expect.equals("default", test2({1: 3}));

  Expect.equals("case-1", test3({1: 1, 2: 1}));
  Expect.equals("case-1", test3({1: 1, 2: 2, 3: 3}));
  Expect.equals("default", test3({1: 1}));
  Expect.equals("case-2", test3({1: 2, 2: 0}));
  Expect.equals("case-2", test3({1: 2, 2: -1, 3: 3}));
  Expect.equals("default", test3({2: 0}));
  Expect.equals("case-3", test3({1: 3, 2: 0}));
  Expect.equals("case-3", test3({1: 3, 2: -1, 3: 3}));
  Expect.equals("default", test3({1: 3}));
}
