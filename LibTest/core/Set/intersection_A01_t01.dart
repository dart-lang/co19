/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract Set<E> intersection(Set<Object> other)
 * Returns a new set which is the intersection between this set and other.
 * the given collection. 
 * @description Checks that the returned intersection is correct as long as the specified
 * set is not null. Element types tested include int, null and String.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void check(List expected, List l1, List l2) {
  Expect.setEquals(new Set.from(expected), new Set.from(l1).intersection(new Set.from(l2)));
}

main() {
  check([2], [1, 2], [2, 3]);
  check([1, 2], [1, 2, 3, 4, 5, 1, 1, 1, 2, 2, 2], [1, 1, 2, 2]);

  //Intersection with an empty set
  check([], [], [1, 2, 3, 4, 5]);
  check([], [1, 2, 3, 4], []);
  check([], [], []);

  //One set fully contains another
  check([1, 2], [1, 2, 3, 4, 5, 6], [1, 2]);
  check([1, 2], [1, 2], [1, 2, 3, 4, 5, 6]);

  //Intersection with itself
  check([1], [1], [1]);
  check([1, 2, 3, 4, 5], [1, 2, 3, 4, 5], [1, 2, 3, 4, 5]);

  //Not intersecting sets
  check([], ["foo"], ["fOo", "bar"]);
  check([], [1, 2, 3, 4, 5], [-1, -2, -3, -4, -5]);
}
