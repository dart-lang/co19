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
library intersection_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

void check(Set create([Iterable content]), List expected, List l1, List l2) {
  Expect.setEquals(create(expected), create(l1).intersection(create(l2)));
}

test(Set create([Iterable content])) {
  check(create, [2], [1, 2], [2, 3]);
  check(create, [1, 2], [1, 2, 3, 4, 5, 1, 1, 1, 2, 2, 2], [1, 1, 2, 2]);

  //Intersection with an empty set
  check(create, [], [], [1, 2, 3, 4, 5]);
  check(create, [], [1, 2, 3, 4], []);
  check(create, [], [], []);

  //One set fully contains another
  check(create, [1, 2], [1, 2, 3, 4, 5, 6], [1, 2]);
  check(create, [1, 2], [1, 2], [1, 2, 3, 4, 5, 6]);

  //Intersection with itself
  check(create, [1], [1], [1]);
  check(create, [1, 2, 3, 4, 5], [1, 2, 3, 4, 5], [1, 2, 3, 4, 5]);

  //Not intersecting sets
  check(create, [], ["foo"], ["fOo", "bar"]);
  check(create, [], [1, 2, 3, 4, 5], [-1, -2, -3, -4, -5]);
}

main() {
  test(create);
}
