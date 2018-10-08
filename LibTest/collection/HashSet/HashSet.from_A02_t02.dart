/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface HashSet.from(Iterable elements)
 * All the [elements] should be assignable to [E]. [The elements] iterable
 * itself may have any element type, so this constructor can be used to
 * down-cast a [Set], for example as:
 * Set<SuperType> superSet = ...;
 * Set<SubType> subSet =
 *     new HashSet<SubType>.from(superSet.where((e) => e is SubType));
 * @description Checks that provided down-cast example works as expected
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:collection";

check(HashSet set, List list1, List list2) {
  Expect.equals(list1. length, set.length);
  list1.forEach((element) => Expect.isTrue(set.contains(element)));
  list2.forEach((element) => Expect.isFalse(set.contains(element)));
}

main() {
  List list = ["testme", 1, 2, 3, null, "", [], [1, 2, 3], {}, new Error(),
      -1, -2, "string1", "string2", "string3", 'a', 'b', 'c'];

  HashSet set = new HashSet<int>.from(list.where((e) => e is int));
  check(set, [1, 2, 3, -1, -2],
      ["testme", null, "", [], [1, 2, 3], {}, new Error(), "string1", "string2",
      "string3", 'a', 'b', 'c']);

  set = new HashSet<String>.from(list.where((e) => e is String));
  check(set, ["testme", "", "string1", "string2", "string3", 'a', 'b', 'c'],
    [1, 2, 3, null, [], [1, 2, 3], {}, new Error(), -1, -2]);

  set = new HashSet.from(list.where((e) => e is Object));
  check(set, list, ["unexist", 0 -5]);
}
