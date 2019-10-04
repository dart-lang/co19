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
 *   @description Checks that result set is correct if two spread elements
 *   contain duplicated values
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../Utils/expect.dart";

main() {
  List aList = [];
  Map aMap = {};
  List list1 = [1, 2, 3, 4, 5];
  List list2 = [3, 2, "checkme", 1];
  List longlist = [1, 2, 3, 4, 5, 6, 7, 144, 148, -1, 14, 143, 55, 11, "string",
    null, aList, aMap, "1", 101, "10", 110, "a", "b", "c", "d", "e", "f", "g",
    "h", 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009];

  Expect.setEquals({1, 2, 3, 4, 5, "checkme"}, {...list1, ...list2});
  Expect.setEquals({3, 2, "checkme", 1, 4, 5}, {...list2, ...list1});
  Expect.setEquals(
    {10000, 1, 2, 3, 4, 5, 11000, 6, 7, 144, 148, -1, 14, 143, 55, 11,
      "string", null, aList, aMap, "1", 101, "10", 110, "a", "b", "c", "d", "e",
      "f", "g", "h", 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009,
      12000},
    {10000, ...list1, 11000, ...longlist, 12000});
  Expect.setEquals(
    {-1, -2, "a", "d", 1, 2, 3, 4, 5, 6, 7, 144, 148, 14, 143, 55, 11,
      "string", null, aList, aMap, "1", 101, "10", 110, "b", "c", "e", "f", "g",
      "h", 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, -3, -4,
      "checkme", -5, -6, -7},
    {-1, -2, "a", "d", ...longlist, -3, 1007, -4, ...list2, -5, -6, -7});
}
