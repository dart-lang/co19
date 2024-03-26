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
/// @description Checks that final map is correct if element and spread element
/// has duplicated keys
/// @author iarkh@unipro.ru

import "dart:collection";
import "../../Utils/expect.dart";

Map map1 = {1: 1, 2: 2, 3: 3, 4: 4, 5: 5};
Map map2 = {4: 7, 2: 12};

main() {
  Expect.mapEquals(
      {-1: 1, -3: 3, 1: 1, 2: 2, 3: 3, 4: 4, 5: 5, 6: 6},
      {-1: 1, 1: 14, -3: 3, ...map1, 6: 6});
  Expect.mapEquals(
      {-1: 1, 1: 14, -3: 3, ...map2, 2: 48},
      {-1: 1, 1: 14, -3: 3, 4: 7, 2: 48});

  Expect.mapEquals(
      {-1: 1, -3: 3, 1: 1, 2: 2, 3: 3, 4: 4, 5: 5, 6: 6},
      {-1: 1, 1: 14, -3: 3, ...?map1, 6: 6});
//                          ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.mapEquals(
    {-1: 1, 1: 14, -3: 3, ...?map2, 2: 48},
//                        ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    {-1: 1, 1: 14, -3: 3, 4: 7, 2: 48});
}
