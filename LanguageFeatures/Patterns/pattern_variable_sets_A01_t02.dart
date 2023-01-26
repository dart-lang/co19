// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The pattern variable set for a pattern is:
///
/// Logical-or: The pattern variable set of either branch. It is a compile-time
/// error if the two branches do not have equal pattern variable sets. Two
/// pattern variable sets are equal if they have the same set of names and each
/// corresponding pair of variables have the same finality and their types are
/// structurally equivalent after NORM().
///
/// @description Check that it is not an error if the two branches of logical-or
/// pattern define equal pattern variable sets
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

String test1(Object? x) {
  switch (x) {
    case var v1 || [var v1] && [_] when v1 == 1:
      return "logical-and";
    case final int v2 || final v2 as int when v2 == 2:
      return "cast";
    case final int? v3 || final int? v3? when v3 == 3:
      return "null-check";
    case final int? v4 || final int? v4! when v4 == 4:
      return "null-assert";
    case var v5 || var v5 when v5 == 5:
      return "variable";
    case final num? v6 || (final num? v6) when v6! == 6:
      return "parenthesized";
    case var v7 || var [v7] when v7 == 7:
      return "list";
    case var v8 || var {"key1": v8} when v8 == 8:
      return "map";
    case final int v9 || final (int v9,) when v9 == 9:
      return "record";
    case final int v10 || Square(sizeAsInt: final int v10) when v10 == 10:
      return "object";
    default:
      return "no match";
  }
}

String test2(Object? x) {
  switch (x) {
    case [var v1] && [_] || var v1 when v1 == 1:
      return "logical-and";
    case final v2 as int || final int v2 when v2 == 2:
      return "cast";
    case final int? v3? || final int? v3 when v3 == 3:
      return "null-check";
    case final int? v4! || final int? v4 when v4 == 4:
      return "null-assert";
    case var v5 || var v5 when v5 == 5:
      return "variable";
    case (final num? v6) || final num? v6 when v6! == 6:
      return "parenthesized";
    case var [v7] || var v7 when v7 == 7:
      return "list";
    case var {"key1": v8} || var v8 when v8 == 8:
      return "map";
    case final (int v9,) || final int v9 when v9 == 9:
      return "record";
    case Square(sizeAsInt: final int v10) || final int v10 when v10 == 10:
      return "object";
    default:
      return "no match";
  }
}

String test3(Object? x) =>
  switch (x) {
    var v1 || [var v1] && [_] when v1 == 1 => "logical-and",
    final int v2 || final v2 as int when v2 == 2 => "cast",
    final int? v3 || final int? v3? when v3 == 3 => "null-check",
    final int? v4 || final int? v4! when v4 == 4 => "null-assert",
    var v5 || var v5 when v5 == 5 => "variable",
    final num? v6 || (final num? v6) when v6! == 6 => "parenthesized",
    var v7 || var [v7] when v7 == 7 => "list",
    var v8 || var {"key1": v8} when v8 == 8 => "map",
    final int v9 || final (int v9,) when v9 == 9 => "record",
    final v10 || Square(sizeAsInt: final v10) when v10 == 10 => "object",
    _ => "no match"
  };

String test4(Object? x) =>
  switch (x) {
    [var v1] && [_] || var v1 when v1 == 1 => "logical-and",
    final v2 as int || final int v2 when v2 == 2 => "cast",
    final int? v3? || final int? v3 when v3 == 3 => "null-check",
    final int? v4! || final int? v4 when v4 == 4 => "null-assert",
    var v5 || var v5 when v5 == 5 => "variable",
    (final num? v6) || final num? v6 when v6! == 6 => "parenthesized",
    var [v7] || var v7 when v7 == 7 => "list",
    var {"key1": v8} || var v8 when v8 == 8 => "map",
    final (int v9,) || final int v9 when v9 == 9 => "record",
    Square(sizeAsInt: final v10) || final v10 when v10 == 10 => "object",
    _ => "no match"
  };

String test5(Object? x) {
  if (x case var v1 || [var v1] && [_] when v1 == 1)
    return "logical-and";
  if (x case final int v2 || final v2 as int when v2 == 2)
    return "cast";
  if (x case final int? v3 || final int? v3? when v3 == 3)
    return "null-check";
  if (x case final int? v4 || final int? v4! when v4 == 4)
    return "null-assert";
  if (x case var v5 || var v5 when v5 == 5)
    return "variable";
  if (x case final num? v6 || (final num? v6) when v6! == 6)
    return "parenthesized";
  if (x case var v7 || var [v7] when v7 == 7)
    return "list";
  if (x case var v8 || var {"key1": v8} when v8 == 8)
    return "map";
  if (x case final int v9 || final (int v9,) when v9 == 9)
    return "record";
  if (x case final int v10 || Square(sizeAsInt: final int v10) when v10 == 10)
    return "object";
  return "no match";
}

String test6(Object x) {
  if (x case [var v1] && [_] || var v1 when v1 == 1)
    return "logical-and";
  if (x case final v2 as int || final int v2 when v2 == 2)
    return "cast";
  if (x case final int? v3? || final int? v3 when v3 == 3)
    return "null-check";
  if (x case final int? v4! || final int? v4 when v4 == 4)
    return "null-assert";
  if (x case var v5 || var v5 when v5 == 5)
    return "variable";
  if (x case (final num? v6) || final num? v6 when v6! == 6)
    return "parenthesized";
  if (x case var [v7] || var v7 when v7 == 7)
    return "list";
  if (x case var {"key1": v8} || var v8 when v8 == 8)
    return "map";
  if (x case final (int v9,) || final int v9 when v9 == 9)
    return "record";
  if (x case Square(sizeAsInt: final int v10) || final int v10 when v10 == 10)
    return "object";
  return "no match";
}

main () {
  Expect.equals("logical-and", test1(1));
  Expect.equals("logical-and", test1([1]));
  Expect.equals("cast", test1(2));
  Expect.equals("null-check", test1(3));
  Expect.equals("null-assert", test1(4));
  Expect.equals("variable", test1(5));
  Expect.equals("parenthesized", test1(6));
  Expect.equals("list", test1(7));
  Expect.equals("list", test1([7]));
  Expect.equals("map", test1(8));
  Expect.equals("map", test1({"key1": 8}));
  Expect.equals("record", test1(9));
  Expect.equals("record", test1((9,)));
  Expect.equals("object", test1(10));
  Expect.equals("object", test1(Square(10)));

  Expect.equals("logical-and", test2(1));
  Expect.equals("logical-and", test2([1]));
  Expect.equals("cast", test2(2));
  Expect.equals("null-check", test2(3));
  Expect.equals("null-assert", test2(4));
  Expect.equals("variable", test2(5));
  Expect.equals("parenthesized", test2(6));
  Expect.equals("list", test2(7));
  Expect.equals("list", test2([7]));
  Expect.equals("map", test2(8));
  Expect.equals("map", test2({"key1": 8}));
  Expect.equals("record", test2(9));
  Expect.equals("record", test2((9,)));
  Expect.equals("object", test2(10));
  Expect.equals("object", test2(Square(10)));

  Expect.equals("logical-and", test3(1));
  Expect.equals("logical-and", test3([1]));
  Expect.equals("cast", test3(2));
  Expect.equals("null-check", test3(3));
  Expect.equals("null-assert", test3(4));
  Expect.equals("variable", test3(5));
  Expect.equals("parenthesized", test3(6));
  Expect.equals("list", test3(7));
  Expect.equals("list", test3([7]));
  Expect.equals("map", test3(8));
  Expect.equals("map", test3({"key1": 8}));
  Expect.equals("record", test3(9));
  Expect.equals("record", test3((9,)));
  Expect.equals("object", test3(10));
  Expect.equals("object", test3(Square(10)));

  Expect.equals("logical-and", test4(1));
  Expect.equals("logical-and", test4([1]));
  Expect.equals("cast", test4(2));
  Expect.equals("null-check", test4(3));
  Expect.equals("null-assert", test4(4));
  Expect.equals("variable", test4(5));
  Expect.equals("parenthesized", test4(6));
  Expect.equals("list", test4(7));
  Expect.equals("list", test4([7]));
  Expect.equals("map", test4(8));
  Expect.equals("map", test4({"key1": 8}));
  Expect.equals("record", test4(9));
  Expect.equals("record", test4((9,)));
  Expect.equals("object", test4(10));
  Expect.equals("object", test4(Square(10)));

  Expect.equals("logical-and", test5(1));
  Expect.equals("logical-and", test5([1]));
  Expect.equals("cast", test5(2));
  Expect.equals("null-check", test5(3));
  Expect.equals("null-assert", test5(4));
  Expect.equals("variable", test5(5));
  Expect.equals("parenthesized", test5(6));
  Expect.equals("list", test5(7));
  Expect.equals("list", test5([7]));
  Expect.equals("map", test5(8));
  Expect.equals("map", test5({"key1": 8}));
  Expect.equals("record", test5(9));
  Expect.equals("record", test5((9,)));
  Expect.equals("object", test5(10));
  Expect.equals("object", test5(Square(10)));

  Expect.equals("logical-and", test6(1));
  Expect.equals("logical-and", test6([1]));
  Expect.equals("cast", test6(2));
  Expect.equals("null-check", test6(3));
  Expect.equals("null-assert", test6(4));
  Expect.equals("variable", test6(5));
  Expect.equals("parenthesized", test6(6));
  Expect.equals("list", test6(7));
  Expect.equals("list", test6([7]));
  Expect.equals("map", test6(8));
  Expect.equals("map", test6({"key1": 8}));
  Expect.equals("record", test6(9));
  Expect.equals("record", test6((9,)));
  Expect.equals("object", test6(10));
  Expect.equals("object", test6(Square(10)));
}
