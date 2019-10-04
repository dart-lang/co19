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
 * @description Checks that result set is correct in case if the same [Iterable]
 * is added inth the set twice.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../Utils/expect.dart";

main() {
  List aList = [];
  Map aMap = {};

  Set set1 = {1, 2, 3, 4, 5};
  Set set2 = {3, 2, "checkme", 1};
  Set set3 = [].toSet();
  Set longset = {1, 2, 3, 4, 5, 6, 7, 144, 148, -1, 14, 143, 55, 11, "string",
    null, aList, aMap, "1", 101, "10", 110, "a", "b", "c", "d", "e", "f", "g",
    "h", 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009};
  Expect.setEquals(set1, {...set1, ...set1});
  Expect.setEquals(set2, {...set2, ...set2});
  Expect.setEquals(set3, {...set3, ...set3});
  Expect.setEquals(longset, {...longset, ...longset});
}
