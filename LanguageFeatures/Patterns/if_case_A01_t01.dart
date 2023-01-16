// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We replace the existing ifStatement rule with:
///
/// ifStatement ::= ifCondition statement ('else' statement)?
/// ifCondition :== 'if' '(' expression ( 'case' guardedPattern )? ')'
///
/// When the condition has no guardedPattern, it behaves as it does today. If
/// there is a guardedPattern, then the expression is evaluated and matched
/// against the subsequent pattern. If it matches, the then branch is executed
/// with any variables the pattern defines in scope. Otherwise, the else branch
/// is executed if there is one.
///
/// A guard is also allowed:
///
/// if (json case [int x, int y] when x == y) {
///   print('Was on coordinate x-y intercept');
/// } else {
///   throw FormatException('Invalid JSON.');
/// }
///
/// @description Checks if-case statement with different patterns and a guard
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String test(int value) {
  if (value case var a1 && 0 || var a1 && 1 when a1 == 0) {
    return "logical-or-1";
  }
  if (value case 1 || 2) {
    return "logical-or-2";
  }
  if (value case var a2 && > 10 && var b2 && < 15 when a2 == 14) {
    return "logical-and-1";
  }
  if (value case > 12 && < 17) {
    return "logical-and-2";
  }
  if (value case < 25 when false) {
    return "relational-1";
  }
  if (value case <= 25 when true) {
    return "relational-2";
  }
  if (value case 30 when 1 > 2) {
    return "constant-1";
  }
  if (value case 30 when 1 < 2) {
    return "constant-2";
  }
  if (value case (var a3 && 40) when a3 == 42) {
    return "parenthesized-1";
  }
  if (value case (40)) {
    return "parenthesized-2";
  } else {
    return "default";
  }
}

String testCast(num value) {
  if (value case var c1 as int when c1 == 42) {
    return "cast-1 =$c1";
  }
  if (value case var c2 as double when c2 > 4) {
    return "cast-2 =${c2.toStringAsFixed(2)}";
  } else {
    return "default";
  }
}

String testNullCheck(int? value) {
  if (value case var a1? when a1 > 0) {
    return "null-check-1";
  }
  if (value case var a2?) {
    return "null-check-2";
  } else {
    return "default";
  }
}

String testNullAssert(int? value) {
  if (value case var a1! when a1 > 0) {
    return "null-assert-1";
  }
  if (value case var a2!) {
    return "null-assert-2";
  } else {
    return "default";
  }
}

String testVariable(int value) {
  if (value case var a1 when a1 > 0) {
    return "variable-1";
  }
  if (value case var a2 when a2 < 0) {
    return "variable-2";
  } else {
    return "default";
  }
}

String testList(List<int> list) {
  if (list case [1, var a] when a > 0) {
    return "list-1";
  }
  if (list case [1, final b, ...] when b < 0) {
    return "list-2";
  }
  if (list case [1, _, ...var r] when !r.isEmpty) {
    return "list-3";
  } else {
    return "default";
  }
}

String testMap(Map<String, int> map) {
  if (map case {"key1": 1, "key2": var a} when a > 0) {
    return "map-1";
  }
  if (map case {"key1": 1, "key2": final b} when b < 0) {
    return "map-2";
  } else {
    return "default";
  }
}

String testRecord(Record record) {
  if (record case (1, int a) when a > 0) {
    return "record-1";
  }
  if (record case (1, final int b) when b < 0) {
    return "record-2";
  }
  if (record case (1, 2, n: int c) when c > 0) {
    return "record-3";
  }
  if (record case (1, 2, n: final int d) when d < 0) {
    return "record-4";
  } else {
    return "default";
  }
}

String testObject(Shape shape) {
  if (shape case Square(sizeAsInt: int a) when a > 2) {
    return "object-1";
  }
  if (shape case Square(areaAsInt: final int b) when b < 4) {
    return "object-2";
  }
  if (shape case Circle(:int sizeAsInt) when sizeAsInt > 1) {
    return "object-3";
  } else {
    return "default";
  }
}

main() {
  Expect.equals("logical-or-1", test(0));
  Expect.equals("logical-or-2", test(1));
  Expect.equals("logical-and-1", test(14));
  Expect.equals("logical-and-2", test(13));
  Expect.equals("default", test(24));
  Expect.equals("relational-2", test(23));
  Expect.equals("constant-2", test(30));
  Expect.equals("parenthesized-2", test(40));

  Expect.equals("cast-1 =42", testCast(42));
  Expect.equals("cast-2 =41.00", testCast(41));
  Expect.equals("default", testCast(3));

  Expect.equals("null-check-2", testNullCheck(0));
  Expect.equals("null-check-1", testNullCheck(1));
  Expect.equals("default", testNullCheck(null));

  Expect.equals("null-assert-1", testNullAssert(1));
  Expect.equals("null-assert-2", testNullAssert(0));
  Expect.throws(() {testNullAssert(null);});

  Expect.equals("variable-1", testVariable(1));
  Expect.equals("variable-2", testVariable(-1));
  Expect.equals("default", testVariable(0));

  Expect.equals("list-1", testList([1, 2]));
  Expect.equals("list-2", testList([1, -1]));
  Expect.equals("list-3", testList([1, 0, 3]));
  Expect.equals("default", testList([1, 0]));

  Expect.equals("map-1", testMap({"key1": 1, "key2": 2}));
  Expect.equals("map-2", testMap({"key1": 1, "key2": -3}));
  Expect.equals("default", testMap({"key1": 1, "key2": 0}));

  Expect.equals("record-1", testRecord((1, 2)));
  Expect.equals("record-2", testRecord((1, -3)));
  Expect.equals("record-3", testRecord((1, 2, n: 3)));
  Expect.equals("record-4", testRecord((1, 2, n: -4)));
  Expect.equals("default", testRecord((1, 0)));
  Expect.equals("default", testRecord((1, 2, n: 0)));

  Expect.equals("object-1", testObject(Square(3)));
  Expect.equals("object-2", testObject(Square(1)));
  Expect.equals("default", testObject(Square(0)));
  Expect.equals("object-3", testObject(Circle(2)));
  Expect.equals("default", testObject(Circle(1)));
}
