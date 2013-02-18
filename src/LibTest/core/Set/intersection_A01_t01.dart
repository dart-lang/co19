/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> intersection(Collection<E> other)
 * Returns a new set which is the intersection between this set and
 * the given collection. 
 * @description Checks that the returned intersection is correct as long as the specified
 * collection is not null. Element types tested include int, null and String.
 * @author rodionov
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";


main() {
  Expect.setEquals([2], new Set.from([1, 2]).intersection([2, 3]));
  Expect.setEquals([1, 2], new Set.from([1, 2, 3, 4, 5, 1, 1, 1, 2, 2, 2]).intersection([1, 1, 2, 2]));

  //Intersection with an empty set
  Expect.setEquals([], new Set.from([]).intersection([1, 2, 3, 4, 5]));
  Expect.setEquals([], new Set.from([1, 2, 3, 4]).intersection([]));
  Expect.setEquals([], new Set.from([]).intersection([]));

  //One set fully contains another
  Expect.setEquals([1, 2], new Set.from([1, 2, 3, 4, 5, 6]).intersection([1, 2]));
  Expect.setEquals([1, 2], new Set.from([1, 2]).intersection([1, 2, 3, 4, 5, 6]));

  //Intersection with itself
  Expect.setEquals([1], new Set.from([1]).intersection([1]));
  Expect.setEquals([1, 2, 3, 4, 5], new Set.from([1, 2, 3, 4, 5]).intersection([1, 2, 3, 4, 5]));

  //Not intersected sets
  Expect.setEquals([], new Set.from(["foo"]).intersection(["fOo", "bar"]));
  Expect.setEquals([], new Set.from([1, 2, 3, 4, 5]).intersection([-1, -2, -3, -4, -5]));
}
