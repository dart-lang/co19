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
/// @description Check that it is no error if any two keys in the map pattern
/// are identical
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

class C {
  const C();
}

String test1(Map map) {
  return switch (map) {
    {const C(): 1, const C(): 2} => "case-1",
    {1: 1, 1: 2} => "case-2",
    {3.14: var a2, 3.14: final b2} => "case-3",
    {"x": final String a3, "x": var b3} => "case-4",
    _ => "default"
  };
}

String test2(Map map) {
  switch (map) {
    case {const C(): 1, const C(): 2}:
      return "case-1";
    case {1: 1, 1: 2}:
      return "case-2";
    case {3.14: var a2, 3.14: final b2}:
      return "case-3";
    case {"x": final String a3, "x": var b3}:
      return "case-4";
    default:
      return "default";
  }
}

String test3(Map map) {
  if (map case {const C(): 1, const C(): 2}) {
    return "case-1";
  }
  if (map case {1: 1, 1: 2}) {
    return "case-2";
  }
  if (map case {3.14: var a2, 3.14: final b2}) {
    return "case-3";
  }
  if (map case {"x": final String a3, "x": var b3}) {
    return "case-4";
  }
  return "default";
}

main() {
  var {const C(): x1, const C(): y1} = {const C(): 1};
  Expect.equals(1, x1);
  Expect.equals(1, y1);

  var {1: x2, 1: y2} = {1: 2};
  Expect.equals(2, x2);
  Expect.equals(2, y2);

  final {3.14: x3, 3.14: y3} = {3.14: 1};
  Expect.equals(1, x3);
  Expect.equals(1, y3);

  Expect.equals("default", test1({const C(): 1}));
  Expect.equals("default", test1({const C(): 2}));
  Expect.equals("default", test1({1: 1}));
  Expect.equals("default", test1({1: 2}));
  Expect.equals("case-3", test1({3.14: 1}));
  Expect.equals("case-4", test1({"x": "y"}));
  Expect.equals("default", test1({"x": 1}));

  Expect.equals("default", test2({const C(): 1}));
  Expect.equals("default", test2({const C(): 2}));
  Expect.equals("default", test2({1: 1}));
  Expect.equals("default", test2({1: 2}));
  Expect.equals("case-3", test2({3.14: 1}));
  Expect.equals("case-4", test2({"x": "y"}));
  Expect.equals("default", test2({"x": 1}));

  Expect.equals("default", test3({const C(): 1}));
  Expect.equals("default", test3({const C(): 2}));
  Expect.equals("default", test3({1: 1}));
  Expect.equals("default", test3({1: 2}));
  Expect.equals("case-3", test3({3.14: 1}));
  Expect.equals("case-4", test3({"x": "y"}));
  Expect.equals("default", test3({"x": 1}));
}
