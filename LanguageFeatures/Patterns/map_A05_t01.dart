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
/// @description Check that it no error if any two record keys are equal
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

String test1(Map map) {
  return switch (map) {
    {(): 1, (): 2} => "case-1",
    {(1,): 1, (1,): 2} => "case-2",
    {(n: 2): var a1, (n: 2): final int b1} => "case-3",
    {(1, n: 2): var a2, (n:2, 1): final int b2} => "case-4",
    _ => "default"
  };
}

String test2(Map map) {
  switch (map) {
    case {(): 1, (): 2}:
      return "case-1";
    case {(1,): 1, (1,): 2}:
      return "case-2";
    case {(n: 1): var a1, (n: 1): final int b1}:
      return "case-3";
    case {(1, n: 2): var a2, (n:2, 1): final int b2}:
      return "case-4";
    default:
      return "default";
  }
}

String test3(Map map) {
  if (map case {(): 1, (): 2}) {
    return "case-1";
  }
  if (map case {(1,): 1, (1,): 2}) {
    return "case-2";
  }
  if (map case {(n: 1): var a1, (n: 1): final int b1}) {
    return "case-3";
  }
  if (map case {(1, n: 2): var a2, (n:2, 1): final int b2}) {
    return "case-4";
  }
  return "default";
}

main() {
  var {(): x1, (): y1} = {(): 1};
  Expect.equals(1, x1);
  Expect.equals(1, y1);

  var {(1,): x2, (1,): y2} = {(1,): 2};
  Expect.equals(2, x2);
  Expect.equals(2, y2);

  final {(n: 1): x3, (n: 1): y3} = {(n: 1): 2};
  Expect.equals(2, x3);
  Expect.equals(2, y3);

  final {(1, n: 2): x4, (n: 2, 1): y4} = {(1, n: 2): 1};
  Expect.equals(1, x4);
  Expect.equals(1, y4);

  Expect.equals("default", test1({(): 1}));
  Expect.equals("default", test1({(): 2}));
  Expect.equals("default", test1({(1,): 1}));
  Expect.equals("default", test1({(1,): 2}));
  Expect.equals("case-3", test1({(n: 1): 1}));
  Expect.equals("default", test1({(n: 1): "2"}));
  Expect.equals("case-4", test1({(1, n: 2): 1}));
  Expect.equals("default", test1({(1, n: 2): "2"}));

  Expect.equals("default", test2({(): 1}));
  Expect.equals("default", test2({(): 2}));
  Expect.equals("default", test2({(1,): 1}));
  Expect.equals("default", test2({(1,): 2}));
  Expect.equals("case-3", test2({(n: 1): 1}));
  Expect.equals("default", test2({(n: 1): "2"}));
  Expect.equals("case-4", test2({(1, n: 2): 1}));
  Expect.equals("default", test2({(1, n: 2): "2"}));

  Expect.equals("default", test3({(): 1}));
  Expect.equals("default", test3({(): 2}));
  Expect.equals("default", test3({(1,): 1}));
  Expect.equals("default", test3({(1,): 2}));
  Expect.equals("case-3", test3({(n: 1): 1}));
  Expect.equals("default", test3({(n: 1): "2"}));
  Expect.equals("case-4", test3({(1, n: 2): 1}));
  Expect.equals("default", test3({(1, n: 2): "2"}));
}
