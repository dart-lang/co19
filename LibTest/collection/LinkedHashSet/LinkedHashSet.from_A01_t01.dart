/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory LinkedHashSet.from(Iterable<E> iterable)
 * Creates a Set that contains all elements of other.
 * The created Set is a HashSet. As such, it considers elements that are equal
 * (using ==) to be undistinguishable, and requires them to have a compatible
 * Object.hashCode implementation.
 * @description Checks that created hash set contains all elements of [iterable].
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(List l1, List l2) {
  LinkedHashSet set1 = new LinkedHashSet.from(l1);
  for (var value in set1) {
    Expect.isTrue(l2.contains(value));
  }
  for (var value in l1) {
    Expect.isTrue(set1.contains(value));
  }
}

main() {
  check([], []);
  check([1,2,3], [1,2,3]);
  check(["1", 1, 2, 2, 3, 3, "4", 4], ["1", 1, 2, 3, "4", 4]);
}
