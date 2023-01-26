// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The pattern variable set for a pattern is:
/// ...
/// Logical-and, cast, null-check, null-assert, parenthesized, list, map,
/// record, or object: The union of the pattern variable sets of all of the
/// immediate subpatterns.
///
/// The union of a series of pattern variable sets is the union of their
/// corresponding sets of variable names. Each variable in the resulting set is
/// mapped to the corresponding variable's type and finality.
///
/// It is a compile-time error if any two sets being unioned have a variable
/// with the same name. A pattern can't declare the same variable more than once
///
/// @description Check that it is a compile-time error if any two sets being
/// unioned have a variable with the same name
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

String test1(Object x) {
  switch (x) {
    case [var v1] && [var v1, ...]:
//                        ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "logical-and";
    case [final v2, final v2] as List<int>:
//                        ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "cast";
    case [final List<int>? v3, final List<int>? v3]?:
//                                              ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "null-check";
    case [final List<int>? v4, final List<int>? v4]!:
//                                              ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "null-assert";
    case (final [List<int> v5, List<int> v5]):
//                                       ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "parenthesized";
    case [final int v6, final int v6]:
//                                ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "list";
    case {"key1": var v7, "key2": var v7}:
//                                ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "map";
    case (int v8, n: int v8):
//                       ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "record";
    case Square(:var sizeAsInt, :var sizeAsInt):
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "object";
    default:
      return "no match";
  }
}

String test2(Object x) {
  if (x case [var v1] && [var v1, ...])
//                            ^^
// [analyzer] unspecified
// [cfe] unspecified
    return "logical-and";
  if (x case [final v2, final v2] as List<int>)
//                            ^^
// [analyzer] unspecified
// [cfe] unspecified
    return "cast";
  if (x case [final List<int>?v3, final List<int>? v3]?)
//                                                 ^^
// [analyzer] unspecified
// [cfe] unspecified
    return "null-check";
  if (x case [final List<int>? v4, final List<int>? v4]!)
//                                                  ^^
// [analyzer] unspecified
// [cfe] unspecified
    return "null-assert";
  if (x case ([List<int> v5, List<int> v5]))
//                                     ^^
// [analyzer] unspecified
// [cfe] unspecified
    return "parenthesized";
  if (x case [int v6, int v6])
//                        ^^
// [analyzer] unspecified
// [cfe] unspecified
    return "list";
  if (x case {"key1": var v7, "key2": var v7})
//                                        ^^
// [analyzer] unspecified
// [cfe] unspecified
    return "map";
  if (x case (int v8, n: int v8))
//                           ^^
// [analyzer] unspecified
// [cfe] unspecified
    return "record";
  if (x case Square(:var sizeAsInt, :var sizeAsInt))
//                                       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "object";
  return "no match";
}

String test3(Object x) =>
  switch (x) {
    [var v1] && [var v1, ...] => "logical-and",
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
    [final v2, final v2] as List<int> => "cast",
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
    [final List<int>? v3, final List<int>? v3]? => "null-check",
//                                         ^^
// [analyzer] unspecified
// [cfe] unspecified
    [List<int>? v4, List<int>? v4]! => "null-assert",
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
    ([final List<int> v5, final List<int> v5]) =>  "parenthesized",
//                                        ^^
// [analyzer] unspecified
// [cfe] unspecified
    [int v6, int v6] => "list",
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
    {"key1": var v7, "key2": var v7} => "map",
//                               ^^
// [analyzer] unspecified
// [cfe] unspecified
    (int v8, n: int v8) => "record",
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified
    Square(:var sizeAsInt, :var sizeAsInt) => "object",
//                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "no match"
  };

main () {
  test1(1);
  test2(1);
  test3(1);
}
