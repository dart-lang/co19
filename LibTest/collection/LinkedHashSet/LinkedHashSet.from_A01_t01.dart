/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory LinkedHashSet.from(Iterable elements)
 * Create a linked hash set containing all [elements]
 * Creates a linked hash set as by [new LinkedHashSet<E>()] and adds each
 * element of [elements] to this set in the order they are iterated.
 * @description Checks that created hash set contains all elements of [iterable].
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(List l1, List l2) {
  LinkedHashSet set = new LinkedHashSet.from(l1);
  for (var value in set) {
    Expect.isTrue(l2.contains(value));
  }
  for (var value in l1) {
    Expect.isTrue(set.contains(value));
  }
}

main() {
  check([], []);
  check([1, 2, 3], [1, 2, 3]);
  check(["1", 1, 2, 2, 3, 3, "4", 4], ["1", 1, 2, 3, "4", 4]);
}
