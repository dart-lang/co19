// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In a switch statement, multiple cases may share the same body.
/// ...
/// At runtime, we initialize all of the shared variables in the body of the
/// case with the values of the corresponding case variables from the matched
/// case.
///
/// @description Checks that at a runtime all of the shared variables in the
/// body of the case with the values of the corresponding case variables from
/// the matched case.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String testLogicalOr(Object obj) {
  switch (obj) {
    case [var a, int n] || [int n, var a] when n < 1:
    case [double n, var a]  || [var a, double n] when n > 1.1:
      return a.toString();
    default:
      return "default";
  }
}

String testLogicalAnd(Object obj) {
  switch (obj) {
    case [var a1, int n1] && [int n2, var a2] when n1 == 1 && n2 == 2:
    case [String n1, var a1] && [var a2, String n2] when n1 == "1" && n2 == "2":
      return "a1=$a1;a2=$a2";
    default:
      return "default";
  }
}

String testCast(Object obj) {
  switch (obj) {
    case [var a as num, int n] when n == 1:
    case [String n, var a as num] when n == "1":
      return a.toString();
    default:
      return "default";
  }
}

String testNullCheck(Object obj) {
  switch (obj) {
    case [var a?, int n] when n == 1:
    case [String n, var a?] when n == "1":
      return a.toString();
    default:
      return "default";
  }
}

String testNullAssert(Object obj) {
  switch (obj) {
    case [var a!, int n] when n == 1:
    case [String n, var a!] when n == "1":
      return a.toString();
    default:
      return "default";
  }
}

String testVariable(int x) {
  switch (x) {
    case int a when a == 42:
    case int a when a == 0:
    case int a:
      return a.toString();
    default:
      return "default";
  }
}

String testParenthesized(int x) {
  switch (x) {
    case (int a) when a == 42:
    case (int a) when a == 0:
    case (int a):
      return a.toString();
    default:
      return "default";
  }
}

String testList(Object obj) {
  switch (obj) {
    case [var a, int n] when n < 1:
    case [double n, var a] when n > 1.1:
    case [var a, String s] when s.isNotEmpty:
      return a.toString();
    default:
      return "default";
  }
}

String testRecord(Object obj) {
  switch (obj) {
    case (var a, int n) when n < 1:
    case (double n, var a) when n > 1.1:
    case (var a, String s) when s.isNotEmpty:
      return a.toString();
    default:
      return "default";
  }
}

String testMap(Object obj) {
  switch (obj) {
    case {"key1": var a, "key2": int n} when n < 1:
    case {"key1": double n, "key2": var a} when n > 1.1:
    case {"key1": var a, "key2": String s} when s.isNotEmpty:
      return a.toString();
    default:
      return "default";
  }
}

String testObject(Object obj) {
  switch (obj) {
    case Square(sizeAsInt: var a, areaAsInt: final n):
    case Rectangle(sizeAsInt: var a, areaAsInt: var n):
    case Shape(sizeAsInt: var a, areaAsInt: final n):
      return a.toString();
    default:
      return "default";
  }
}

main() {
  Expect.equals("1", testLogicalOr([1, 0]));
  Expect.equals("2", testLogicalOr([-1, 2]));
  Expect.equals("3", testLogicalOr([3.14, 3]));
  Expect.equals("4", testLogicalOr([4, 3.14]));
  Expect.equals("1", testLogicalOr([1, 1]));
  Expect.equals("a1=1;a2=2", testLogicalAnd([1, 2]));
  Expect.equals("a1=1;a2=2", testLogicalAnd(["1", "2"]));
  Expect.equals("42", testCast([42, 1]));
  Expect.equals("42", testCast(["1", 42]));
  Expect.equals("42", testNullCheck([42, 1]));
  Expect.equals("42", testNullCheck(["1", 42]));
  Expect.equals("42", testNullAssert([42, 1]));
  Expect.equals("42", testNullAssert(["1", 42]));
  Expect.equals("42", testVariable(42));
  Expect.equals("0", testVariable(0));
  Expect.equals("1", testVariable(1));
  Expect.equals("42", testParenthesized(42));
  Expect.equals("0", testParenthesized(0));
  Expect.equals("1", testParenthesized(1));
  Expect.equals("-1", testList([-1, -2]));
  Expect.equals("2", testList([3.14, 2]));
  Expect.equals("1", testList([1, "42"]));
  Expect.equals("-1", testRecord((-1, -2)));
  Expect.equals("2", testRecord((3.14, 2)));
  Expect.equals("1", testRecord((1, "42")));
  Expect.equals("-1", testMap({"key1": -1, "key2": -2}));
  Expect.equals("2", testMap({"key1": 3.14, "key2": 2}));
  Expect.equals("1", testMap({"key1": 1, "key2": "42"}));
  Expect.equals("1", testObject(Square(1)));
  Expect.equals("1", testObject(Rectangle(1, 2)));
  Expect.equals("0", testObject(Shape()));
}
