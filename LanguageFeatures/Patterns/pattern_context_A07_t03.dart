// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// You can also use var _ or final _ to write a wildcard in a matching context
/// because it would require additional specification to explicitly forbid it,
/// but doing so is discouraged.
///
/// @description Checks that var _ or final _ can be used as a wildcard in a
/// matching context. Test switch statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String testLogicalOr1(int x) {
  if (x case var _ || var _) {
    return "match";
  }
  return "no match";
}

String testLogicalOr2(int x) {
  if (x case final _ || final _) {
    return "match";
  }
  return "no match";
}

String testLogicalOr3(int x) {
  if (x case final int _ || final int _) {
    return "match";
  }
  return "no match";
}

String testLogicalOr4(int x) {
  if (x case int _ || int _) {
    return "match";
  }
  return "no match";
}

String testLogicalAnd1(int x) {
  if (x case var _ && var _) {
    return "match";
  }
  return "no match";
}

String testLogicalAnd2(int x) {
  if (x case final _ && final _) {
    return "match";
  }
  return "no match";
}

String testLogicalAnd3(int x) {
  if (x case final int _ && final int _) {
    return "match";
  }
  return "no match";
}

String testLogicalAnd4(int x) {
  if (x case int _ && int _) {
    return "match";
  }
  return "no match";
}

String testCast1(num x) {
  if (x case var _ as int) {
    return "match";
  }
  return "no match";
}

String testCast2(num x) {
  if (x case final _ as int) {
    return "match";
  }
  return "no match";
}

String testCast3(num x) {
  if (x case num _ as int) {
    return "match";
  }
  return "no match";
}

String testCast4(num x) {
  if (x case final int _ as int) {
    return "match";
  }
  return "no match";
}

String testNullCheck1(int? x) {
  if (x case var _?) {
    return "match";
  }
  return "no match";
}

String testNullCheck2(int? x) {
  if (x case final _?) {
    return "match";
  }
  return "no match";
}

String testNullCheck3(int? x) {
  if (x case int _?) {
    return "match";
  }
  return "no match";
}

String testNullCheck4(int? x) {
  if (x case final int _?) {
    return "match";
  }
  return "no match";
}

String testNullAssert1(int? x) {
  if (x case var _!) {
    return "match";
  }
  return "no match";
}

String testNullAssert2(int? x) {
  if (x case final _!) {
    return "match";
  }
  return "no match";
}

String testNullAssert3(int? x) {
  if (x case int? _!) {
    return "match";
  }
  return "no match";
}

String testNullAssert4(int? x) {
  if (x case final int? _!) {
    return "match";
  }
  return "no match";
}

String testVariable1(int x) {
  if (x case var _) {
    return "match";
  }
  return "no match";
}

String testVariable2(int x) {
  if (x case final _) {
    return "match";
  }
  return "no match";
}

String testVariable3(int x) {
  if (x case int _) {
    return "match";
  }
  return "no match";
}

String testVariable4(int x) {
  if (x case final int _) {
    return "match";
  }
  return "no match";
}

String testParenthesized1(int x) {
  if (x case (var _)) {
    return "match";
  }
  return "no match";
}

String testParenthesized2(int x) {
  if (x case (final _)) {
    return "match";
  }
  return "no match";
}

String testParenthesized3(int x) {
  if (x case (int _)) {
    return "match";
  }
  return "no match";
}

String testParenthesized4(int x) {
  if (x case (final int _)) {
    return "match";
  }
  return "no match";
}

String testList1(List<int> x) {
  if (x case [var _]) {
    return "match";
  }
  return "no match";
}

String testList2(List<int> x) {
  if (x case [final _]) {
    return "match";
  }
  return "no match";
}

String testList3(List<int> x) {
  if (x case [int _]) {
    return "match";
  }
  return "no match";
}

String testList4(List<int> x) {
  if (x case [final int _]) {
    return "match";
  }
  return "no match";
}

String testMap1(Map<String, int> x) {
  if (x case {"key1": var _}) {
    return "match";
  }
  return "no match";
}

String testMap2(Map<String, int> x) {
  if (x case {"key1": final _}) {
    return "match";
  }
  return "no match";
}

String testMap3(Map<String, int> x) {
  if (x case {"key1": int _}) {
    return "match";
  }
  return "no match";
}

String testMap4(Map<String, int> x) {
  if (x case {"key1": final int _}) {
    return "match";
  }
  return "no match";
}

String testRecord1(Record x) {
  if (x case (var _,)) {
    return "match";
  }
  return "no match";
}

String testRecord2(Record x) {
  if (x case (final _,)) {
    return "match";
  }
  return "no match";
}

String testRecord3(Record x) {
  if (x case (int _,)) {
    return "match";
  }
  return "no match";
}

String testRecord4(Record x) {
  if (x case (final int _,)) {
    return "match";
  }
  return "no match";
}

String testObject1(Shape shape) {
  if (shape case Square(areaAsInt: var _)) {
    return "match";
  }
  return "no match";
}

String testObject2(Shape shape) {
  if (shape case Square(areaAsInt: final _)) {
    return "match";
  }
  return "no match";
}

String testObject3(Shape shape) {
  if (shape case Square(areaAsInt: int _)) {
    return "match";
  }
  return "no match";
}

String testObject4(Shape shape) {
  if (shape case Square(areaAsInt: final int _)) {
    return "match";
  }
  return "no match";
}

main() {
  Expect.equals("match", testLogicalOr1(2));
  Expect.equals("match", testLogicalOr2(1));
  Expect.equals("match", testLogicalOr3(2));
  Expect.equals("match", testLogicalOr4(1));
  Expect.equals("match", testLogicalAnd1(2));
  Expect.equals("match", testLogicalAnd2(1));
  Expect.equals("match", testLogicalAnd3(2));
  Expect.equals("match", testLogicalAnd4(1));
  Expect.equals("match", testCast1(1));
  Expect.equals("match", testCast2(1));
  Expect.equals("match", testCast3(1));
  Expect.equals("match", testCast4(1));
  Expect.throws(() {testCast1(3.14);});
  Expect.throws(() {testCast2(3.14);});
  Expect.throws(() {testCast3(3.14);});
  Expect.throws(() {testCast4(3.14);});
  Expect.equals("match", testNullCheck1(1));
  Expect.equals("match", testNullCheck2(1));
  Expect.equals("match", testNullCheck3(1));
  Expect.equals("match", testNullCheck4(1));
  Expect.equals("no match", testNullCheck1(null));
  Expect.equals("no match", testNullCheck2(null));
  Expect.equals("no match", testNullCheck3(null));
  Expect.equals("no match", testNullCheck4(null));
  Expect.equals("match", testNullAssert1(1));
  Expect.equals("match", testNullAssert2(1));
  Expect.equals("match", testNullAssert3(1));
  Expect.equals("match", testNullAssert4(1));
  Expect.throws(() {testNullAssert1(null);});
  Expect.throws(() {testNullAssert2(null);});
  Expect.throws(() {testNullAssert3(null);});
  Expect.throws(() {testNullAssert4(null);});
  Expect.equals("match", testVariable1(1));
  Expect.equals("match", testVariable2(1));
  Expect.equals("match", testVariable3(1));
  Expect.equals("match", testVariable4(1));
  Expect.equals("match", testParenthesized1(1));
  Expect.equals("match", testParenthesized2(1));
  Expect.equals("match", testParenthesized3(1));
  Expect.equals("match", testParenthesized4(1));
  Expect.equals("match", testList1([1]));
  Expect.equals("match", testList2([1]));
  Expect.equals("match", testList3([1]));
  Expect.equals("match", testList4([1]));
  Expect.equals("no match", testList1([1, 2]));
  Expect.equals("no match", testList2([1, 2]));
  Expect.equals("no match", testList3([1, 2]));
  Expect.equals("no match", testList4([1, 2]));
  Expect.equals("match", testMap1({"key1": 1}));
  Expect.equals("match", testMap2({"key1": 1}));
  Expect.equals("match", testMap3({"key1": 1}));
  Expect.equals("match", testMap4({"key1": 1}));
  Expect.equals("no match", testMap1({"key1": 1, "key2": 2}));
  Expect.equals("no match", testMap2({"key1": 1, "key2": 2}));
  Expect.equals("no match", testMap3({"key1": 1, "key2": 2}));
  Expect.equals("no match", testMap4({"key1": 1, "key2": 2}));
  Expect.equals("match", testRecord1((1,)));
  Expect.equals("match", testRecord2((1,)));
  Expect.equals("match", testRecord3((1,)));
  Expect.equals("match", testRecord4((1,)));
  Expect.equals("no match", testRecord1((1, name: "one")));
  Expect.equals("no match", testRecord2((1, name: "one")));
  Expect.equals("no match", testRecord3((1, name: "one")));
  Expect.equals("no match", testRecord4((1, name: "one")));
  Expect.equals("match", testObject1(Square(1)));
  Expect.equals("match", testObject2(Square(1)));
  Expect.equals("match", testObject3(Square(1)));
  Expect.equals("match", testObject4(Square(1)));
  Expect.equals("no match", testObject1(Circle(1)));
  Expect.equals("no match", testObject2(Circle(1)));
  Expect.equals("no match", testObject3(Circle(1)));
  Expect.equals("no match", testObject4(Circle(1)));
}
