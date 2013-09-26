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
 * Both empty and non-empty argument maps are tested.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(Set m1, Set m2) {
  Expect.equals(m1.length, m2.length);
  m1.forEach((var key, var value) {
    Expect.isTrue(m2.containsKey(key));
    Expect.equals(value, m2[key]);
  });
}

main() {
  Map m = {"1": 1, "2": 2, "3": 3, "4": 4};
  LinkedHashSet set = new LinkedHashSet.from(m);
  check(m, set);

  m = new Map();
  set = new LinkedHashSet.from(m);
  Expect.isTrue(set.isEmpty);
}
