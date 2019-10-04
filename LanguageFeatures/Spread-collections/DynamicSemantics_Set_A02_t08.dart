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
 * @description Checks that result set is correct in case when spread [Iterable]
 * contains duplicated elements
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../Utils/expect.dart";

main() {
  List list1 = [0, 0];
  List list2 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
  List list3 = ["a", "b", "a", "c", 1, "d", 1, "b", 2, "a", 3, "e", 4, 3, "a"];

  Expect.setEquals({0}, {...list1});
  Expect.setEquals({1}, {...list2});
  Expect.setEquals({"a", "b", "c", 1, "d", 2, 3, "e", 4}, {...list3});
}
