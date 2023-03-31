// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Since Dart allows if elements inside collection literals, we also
/// support if-case elements. We replace the existing ifElement rule with:
//
// ifElement ::= ifCondition element ('else' element)?
// The semantics follow the statement form. If there is no guardedPattern, then
// it behaves as before. When there is a guardedPattern, if the expression
// matches the pattern (and the guard returns true) then we evaluate and yield
// the then element into the surrounding collection. Otherwise, we evaluate and
// yield the else element if there is one.
///
/// @description Checks if-case element with different patterns and an optional
/// guard in a set literal
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

Set<int> testLogicalOr1(int value) =>
    {
      1,
      if (value case var a && 0 || var a && 1 when a == 0) 2 else 3,
      4
    };

Set<int> testLogicalOr2(int value) {
  return {
    1,
    if (value case 1 || 2) 2 else 3,
    4
  };
}

Set<int> testLogicalAnd1(int value) =>
    {
      1,
      if (value case var a && > 10 && var b && < 15 when a == 14) 2 else 3,
      4
    };

Set<int> testLogicalAnd2(int value) {
  return {
    1,
    if (value case > 12 && < 17) 2 else 3,
    4
  };
}

Set<int> testRelational(int value, bool guard) {
  return {
    1,
    if (value case < 25 when guard) 2 else 3,
    4
  };
}

Set<int> testConstant(int value, int guard) {
  return {
    1,
    if (value case 30 when guard == 42) 2 else 3,
    4
  };
}

Set<int> testParenthesized1(int value, int guard) {
  return {
    1,
    if (value case (var a && 40) when a == guard) 2 else 3,
    4
  };
}

Set<int> testParenthesized2(int value) =>
    {
      1,
      if (value case (42)) 2 else 3,
      4
    };

Set<int> testCast(num value) {
  return {
    1,
    if (value case var c1 as int when c1 == 42) 2 else 3,
    4
  };
}

Set<int> testNullCheck1(int? value) {
  return {
    1,
    if (value case var a? when a > 0) 2 else 3,
    4
  };
}

Set<int> testNullCheck2(int? value) =>
    {
      1,
      if (value case var a?) 2 else 3,
      4
    };

Set<int> testNullAssert(int? value) {
  return {
    1,
    if (value case var a! when a > 0) 2 else 3,
    4
  };
}

Set<int> testVariable(int value) {
  return {
    1,
    if (value case var a when a > 0) 2 else 3,
    4
  };
}

Set<int> testList1(List<int> list) {
  return {
    1,
    if (list case [1, var a] when a > 0) 2 else 3,
    4
  };
}

Set<int> testList2(List<int> list) {
  return {
    1,
    if (list case [1, final b, ...] when b < 0) 2 else 3,
    4
  };
}

Set<int> testList3(List<int> list) {
  return {
    1,
    if (list case [1, _, ...var r] when !r.isEmpty) 2 else 3,
    4
  };
}

Set<int> testMap1(Map<String, int> map) {
  return {
    1,
    if (map case {"key1": 1, "key2": var a} when a > 0) 2 else 3,
    4
  };
}

Set<int> testMap2(Map<String, int> map) =>
    {
      1,
      if (map case {"key1": 1, "key2": final b} when b < 0) 2 else 3,
      4
    };

Set<int> testRecord1(Record record) {
  return {
    1,
    if (record case (1, int a) when a > 0) 2 else 3,
    4
  };
}

Set<int> testRecord2(Record record) =>
  {
    1,
    if (record case (1, 2, n: final int d) when d < 0) 2 else 3,
    4
  };

Set<int> testObject1(Shape shape) {
  return {
    1,
    if (shape case Square(sizeAsInt: var a) when a > 2) 2 else 3,
    4
  };
}

Set<int> testObject2(Shape shape) => {
    1,
    if (shape case Circle(: final sizeAsInt) when sizeAsInt > 1) 2 else 3,
    4
  };

Set<int> testObject3(Shape shape) {
  return {
    1,
    if (shape case Square(sizeAsInt: 1)) 2 else 3,
    4
  };
}

main() {
    Expect.setEquals({1, 2, 4}, testLogicalOr1(0));
    Expect.setEquals({1, 3, 4}, testLogicalOr1(1));
    Expect.setEquals({1, 2, 4}, testLogicalOr2(1));
    Expect.setEquals({1, 2, 4}, testLogicalOr2(2));
    Expect.setEquals({1, 3, 4}, testLogicalOr2(3));
    Expect.setEquals({1, 2, 4}, testLogicalAnd1(14));
    Expect.setEquals({1, 3, 4}, testLogicalAnd1(13));
    Expect.setEquals({1, 3, 4}, testLogicalAnd1(10));
    Expect.setEquals({1, 3, 4}, testLogicalAnd1(15));
    Expect.setEquals({1, 2, 4}, testLogicalAnd2(15));
    Expect.setEquals({1, 3, 4}, testLogicalAnd2(10));
    Expect.setEquals({1, 3, 4}, testLogicalAnd2(20));
    Expect.setEquals({1, 2, 4}, testRelational(20, true));
    Expect.setEquals({1, 3, 4}, testRelational(20, false));
    Expect.setEquals({1, 3, 4}, testRelational(25, true));
    Expect.setEquals({1, 2, 4}, testConstant(30, 42));
    Expect.setEquals({1, 3, 4}, testConstant(30, 41));
    Expect.setEquals({1, 3, 4}, testConstant(31, 42));
    Expect.setEquals({1, 2, 4}, testParenthesized1(40, 40));
    Expect.setEquals({1, 3, 4}, testParenthesized1(42, 40));
    Expect.setEquals({1, 3, 4}, testParenthesized1(40, 42));
    Expect.setEquals({1, 2, 4}, testParenthesized2(42));
    Expect.setEquals({1, 3, 4}, testParenthesized2(40));
    Expect.setEquals({1, 2, 4}, testCast(42));
    Expect.setEquals({1, 3, 4}, testCast(41));
    Expect.setEquals({1, 2, 4}, testNullCheck1(1));
    Expect.setEquals({1, 3, 4}, testNullCheck1(-1));
    Expect.setEquals({1, 3, 4}, testNullCheck1(null));
    Expect.setEquals({1, 2, 4}, testNullCheck2(1));
    Expect.setEquals({1, 2, 4}, testNullCheck2(-1));
    Expect.setEquals({1, 3, 4}, testNullCheck2(null));
    Expect.setEquals({1, 2, 4}, testNullAssert(1));
    Expect.setEquals({1, 3, 4}, testNullAssert(-1));
    Expect.throws(() {testNullAssert(null);});
    Expect.setEquals({1, 2, 4}, testVariable(1));
    Expect.setEquals({1, 3, 4}, testVariable(-1));
    Expect.setEquals({1, 2, 4}, testList1([1, 42]));
    Expect.setEquals({1, 3, 4}, testList1([2, 42]));
    Expect.setEquals({1, 3, 4}, testList1([1, 0]));
    Expect.setEquals({1, 3, 4}, testList1([1, 42, 0]));
    Expect.setEquals({1, 2, 4}, testList2([1, -42]));
    Expect.setEquals({1, 3, 4}, testList2([2, -42]));
    Expect.setEquals({1, 3, 4}, testList2([1, 0]));
    Expect.setEquals({1, 2, 4}, testList2([1, -42, 0]));
    Expect.setEquals({1, 2, 4}, testList3([1, 2, 3]));
    Expect.setEquals({1, 3, 4}, testList3([2, 2]));
    Expect.setEquals({1, 3, 4}, testList3([1, 0]));
    Expect.setEquals({1, 2, 4}, testList3([1, -42, 0]));
    Expect.setEquals({1, 2, 4}, testMap1({"key1": 1, "key2": 2}));
    Expect.setEquals({1, 3, 4}, testMap1({"key1": 2, "key2": 2}));
    Expect.setEquals({1, 3, 4}, testMap1({"key1": 1, "key2": -2}));
    Expect.setEquals({1, 2, 4}, testMap1({"key1": 1, "key2": 2, "key3": 3}));
    Expect.setEquals({1, 2, 4}, testMap2({"key1": 1, "key2": -2}));
    Expect.setEquals({1, 3, 4}, testMap2({"key1": 2, "key2": -2}));
    Expect.setEquals({1, 3, 4}, testMap2({"key1": 1, "key2": 2}));
    Expect.setEquals({1, 2, 4}, testMap2({"key1": 1, "key2": -2, "key3": 3}));
    Expect.setEquals({1, 2, 4}, testRecord1((1, 2)));
    Expect.setEquals({1, 3, 4}, testRecord1((2, 2)));
    Expect.setEquals({1, 3, 4}, testRecord1((1, -2)));
    Expect.setEquals({1, 2, 4}, testRecord2((1, 2, n: -1)));
    Expect.setEquals({1, 3, 4}, testRecord2((2, 2, n: 1)));
    Expect.setEquals({1, 3, 4}, testRecord2((1, 2, n: 1)));
    Expect.setEquals({1, 3, 4}, testRecord2((1, n: 1)));
    Expect.setEquals({1, 3, 4}, testRecord2((1, 2, n: 1, n2: 2)));
    Expect.setEquals({1, 2, 4}, testObject1(Square(3)));
    Expect.setEquals({1, 3, 4}, testObject1(Circle(3)));
    Expect.setEquals({1, 3, 4}, testObject1(Square(1)));
    Expect.setEquals({1, 2, 4}, testObject2(Circle(3)));
    Expect.setEquals({1, 3, 4}, testObject2(Circle(1)));
    Expect.setEquals({1, 3, 4}, testObject2(Square(3)));
    Expect.setEquals({1, 2, 4}, testObject3(Square(1)));
    Expect.setEquals({1, 3, 4}, testObject3(Circle(1)));
    Expect.setEquals({1, 3, 4}, testObject3(Square(3)));
}
