// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A list literal <E>[elem_1 ... elem_n] is evaluated as follows:
///
/// 2. For each entry in the map literal:
///    i. If entry is a spread element:
///       a. Evaluate the entry's expression to a value value.
///       b. If entry is null-aware and value is [null], continue to the next
///          entry in the literal.
///       c. Evaluate [value.entries.iterator] to a value iterator.
///       d. Loop:
///          a. If [iterator.moveNext()] returns [false], exit the loop.
///          b. Evaluate [iterator.current] to a value [newEntry].
///          c. Call map[newEntry.key] = newEntry.value.
///    ii. Else, entry has form [e1: e2]:
///       a. Evaluate [e1] to a value key.
///       b. Evaluate [e2] to a value value.
///       c. Call map[key] = value.
///
/// @description Checks that final map is correct if two its elements have
/// duplicated keys
/// @author iarkh@unipro.ru

import "dart:collection";
import "../../Utils/expect.dart";

Map map1 = {1: 1, 2: 2, 3: 3, 4: 4, 5: 5};
Map map2 = {4: 7, 2: 12};
Map verylongmap = {1: "test", 2: 248, 14: 10, -7: "-7", 100: 218, 13: -24.11,
  24: 14, 8: -8, 174: "13", 149: null, "12345": 12345, 27: 37, 222: null,
  -100: "-", 147: "", "": "", 100000: -100, 12456: -11, 23: 23, 25: 25, 17: 27,
  349: 2222222, -12345: "12345", 123: 123, 122: 122, 121: 121, 120: 249,
  "a": "a", "b": "b", "c": "c", "d": "d", "e": "e", "y": "y", -1000: -1000};

main() {
  Expect.mapEquals(
      {8: 4, 1: 1, 2: 2, 3: 3, 4: 4, 5: 5, -6: 6},
      {8: 4, 5: 112, 1: 14, ...map1, -6: 6});

  Expect.mapEquals(
      {-1: 1, 4: 7, 22: 22, 2: 10},
      {-1: 1, ...map2, 22: 22, 2: 10});

  Expect.mapEquals(
      {8: 4, 1: 1, 3: 3, 4: 4, -6: 6, 2: 20, 14: 241, 5: 7},
      {8: 4, 3: 112, 1: 10, ...map1, -6: 6, 2: 20, 14: 241, 5: 7});

  Expect.mapEquals(
      {"p": "p", 3: 112, 146:149, 1: "test", 2: 248, 100: 218,
        13: -24.11, 24: 14, 8: -8, 174: "13", 149: null, "12345": 12345, 27: 37,
        222: null, -100: "-", 147: "", "": "", 100000: -100, 12456: -11, 23: 23,
        25: 25, 17: 27, 349: 2222222, -12345: "12345", 123: 123, 122: 122,
        120: 249, "a": "a", "c": "c", "d": "d", "e": "e", "y": "y", -6: 6,
        14: 20, -1000: 241, 5: 7, 121: 14, "b": "c", -7: -7},
      {"c": "d", 2: -2, "y": 14, "p": "p", 3: 112, 1: 10, 146:149,
        ...verylongmap, -6: 6, 14: 20, -1000: 241, 5: 7, 121: 14, "b": "c",
        -7: -7});

  Expect.mapEquals(
      {8: 4, 1: 1, 2: 2, 3: 3, 4: 4, 5: 5, -6: 6},
      {8: 4, 5: 112, 1: 14, ...?map1, -6: 6});
//                          ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  Expect.mapEquals(
      {-1: 1, 4: 7, 22: 22, 2: 10},
      {-1: 1, ...?map2, 22: 22, 2: 10});
//            ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  Expect.mapEquals(
      {8: 4, 1: 1, 3: 3, 4: 4, -6: 6, 2: 20, 14: 241, 5: 7},
      {8: 4, 3: 112, 1: 10, ...?map1, -6: 6, 2: 20, 14: 241, 5: 7});
//                          ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  Expect.mapEquals(
      {"p": "p", 3: 112, 146:149, 1: "test", 2: 248, 100: 218,
        13: -24.11, 24: 14, 8: -8, 174: "13", 149: null, "12345": 12345, 27: 37,
        222: null, -100: "-", 147: "", "": "", 100000: -100, 12456: -11, 23: 23,
        25: 25, 17: 27, 349: 2222222, -12345: "12345", 123: 123, 122: 122,
        120: 249, "a": "a", "c": "c", "d": "d", "e": "e", "y": "y", -6: 6,
        14: 20, -1000: 241, 5: 7, 121: 14, "b": "c", -7: -7},
      {"c": "d", 2: -2, "y": 14, "p": "p", 3: 112, 1: 10, 146:149,
      ...?verylongmap, -6: 6, 14: 20, -1000: 241, 5: 7, 121: 14, "b": "c",
//    ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
      -7: -7});
}
