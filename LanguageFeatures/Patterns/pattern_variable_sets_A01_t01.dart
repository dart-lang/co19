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
/// @description Check that it is a compile-time error if the two branches do
/// not have equal pattern variable sets
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

String test1(Object? x) {
  switch (x) {
    case int v0 || [var v0] when v0 == 0:
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "logical-or";
    case var v1 || [var v1] && [var v2, ...] when v1 == 1:
//                                  ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "logical-and";
    case final num v2 || final v2 as int when v2 == 2:
//                                   ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "cast";
    case final int v3 || final int? v3? when v3 == 3:
//                             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "null-check";
    case final int v4 || final int? v4! when v4 == 4:
//                             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "null-assert";
    case var v5 || final v5 when v5 == 5:
//                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "variable";
    case final num? v6 || (num? v6) when v6! == 6:
//                         ^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "parenthesized";
    case final v7 || final [int v7] when v7 == 7:
//                          ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "list";
    case var v8 || var {"key1": v88} when v8 == 8:
//                              ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "map";
    case final int v9 || (final int v9, n: v99) when v9 == 9:
//                                         ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "record";
    case final int v10 || Square(:var sizeAsInt) when v10 == 10:
//                                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "object";
    default:
      return "no match";
  }
}

String test2(Object? x) {
  if (x case int v0 || [var v0] when v0 == 0)
//                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "logical-or";
  if (x case var v1 || [var v1] && [var v2, ...] when v1 == 1)
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
    return "logical-and";
  if (x case final num v2 || final v2 as int when v2 == 2)
//                                       ^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "cast";
  if (x case final int v3 || final int? v3? when v3 == 3)
//                                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "null-check";
  if (x case final int v4! || final int? v4! when v4 == 4)
//                                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "null-assert";
  if (x case var v5 || final v5 when v5 == 5)
//                     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "variable";
  if (x case final num? v6 || (num? v6) when v6! == 6)
//                             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "parenthesized";
  if (x case final v7 || [final int v7] when v7 == 7)
//                              ^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "list";
  if (x case var v8 || {"key1": var v88} when v8 == 8)
//                                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "map";
  if (x case final int v9 || (final int v9, n: v99) when v9 == 9)
//                                             ^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "record";
  if (x case final int v10 || Square(:var sizeAsInt) when v10 == 10)
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "object";
  return "no match";
}

String test3(Object? x) =>
  switch (x) {
    int v0 || [var v0] when v0 == 0 => "logical-or",
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
    var v1 || [var v1] && [var v2, ...] when v1 == 1 => "logical-and",
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
    final num v2 || final v2 as int when v2 == 2 => "cast",
//                              ^^^
// [analyzer] unspecified
// [cfe] unspecified
    final int v3 || final int? v3? when v3 == 3 => "null-check",
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    final int v4 || final int? v4! when v4 == 4 => "null-assert",
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var v5 || final v5 when v5 == 5 => "variable",
//            ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    final num? v6 || (num? v6) when v6! == 6 =>  "parenthesized",
//                    ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    final v7 || [final int v7] when v7 == 7 => "list",
//                     ^^^
// [analyzer] unspecified
// [cfe] unspecified
    var v8 || {"key1": var v88} when v8 == 8 => "map",
//                         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    final int v9 || (final int v9, n: v99) when v9 == 9 => "record",
//                                    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    final int v10 || Square(:var sizeAsInt) when v10 == 10 => "object",
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "no match"
  };

main () {
  test1(1);
  test2(1);
  test3(1);
}
