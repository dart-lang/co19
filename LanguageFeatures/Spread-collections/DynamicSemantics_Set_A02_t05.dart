/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * A set literal <E>{elem_1 ... elem_n} is evaluated as follows:
 *   1. Create a fresh instance of set of a class that implements
 *      [LinkedHashSet<E>].
 *   ...
 *   3. The result of the literal expression is [set].
 *   @description Checks that result set is correct if one spread elements is
 *   duplicated
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../Utils/expect.dart";

main() {
  List list1 = [1, 2, 3, 4, 5];
  List list2 = [1 ,2, 3, "checkme"];
  List aList = [];
  Map aMap = {};

  List longlist = [1, 2, 3, 4, 5, 6, 7, 144, 148, -1, 14, 143, 55, 11, "string",
    null, aList, aMap, "1", 101, "10", 110, "a", "b", "c", "d", "e", "f", "g",
    "h", 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009];

  Expect.setEquals({5, 4, 3, 1, 2}, {5, 4, 3, ...list1});
  Expect.setEquals({1, 2, 3, 4, 5, 6}, {...list1, 6});
  Expect.setEquals(
    {3, 1, 2, "checkme", 6, 4, 8},
    {3, ...list2, 6, 4, 8, 1, "checkme"});
  Expect.setEquals(
    {10, 9, 8, 7, 6, 5, 4, 1, 2, 3, "checkme", 0},
    {10, 9, 8, 7, 6, 5, 4, ...list1, 3, 2, 1, ...list2, 0});
  Expect.setEquals(
      {1000, 999, 998, 5, 10, 4, 11, 3, 1, 2, 6, 7, 144, 148, -1, 14, 143, 55,
        "string", null, aList, aMap, "1", 101, "10", 110, "a", "b", "c", "d",
        "e", "f", "g", "h", 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008,
        1009, "x", "y", "z"},
      {1000, 999, 998, 5, 10, 4, 11, 3, ...longlist, "a", "b", "x", "y", "z"});
}
