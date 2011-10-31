/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> intersection(Collection<E> other)
 * Returns a new set which is the intersection between this set and
 * the given collection.
 * @description Tries to pass the collection with not hashable elements
 * @author msyabro
 * @needsreview This test is correct only if the hash set is default implementation of [Set].
 */

check(Set s, Collection col) {
  try {
   s.intersection(col);
   Expect.fail("NoSuchMethodException is expected");
  } catch(NoSuchMethodException e) {}
}

main() {
  check(new Set.from([1, 2]), [new Object()]);
  check(new Set.from([1, 2]), [1, new Object()]);
}
