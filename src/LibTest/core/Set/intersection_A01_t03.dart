/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> intersection(Collection<E> other)
 * Returns a new set which is the intersection between this set and
 * the given collection.
 * @description Checks that new set is returned and [:this:] is not changed.
 * @author msyabro
 * @needsreview Separate into two different tests?
 */

main() {
  Set s = new Set();
  Set newSet = s.intersection([1, 2, 3]);
  Expect.setEquals(s, []);
  if(newSet === s) {
    Expect.fail("[:intersection():] has returned [:this:]");
  }

  s = new Set.from([1, 2 , 3]);
  newSet = s.intersection([1, 2, 3]);
  Expect.setEquals(s, [1, 2, 3]);
  if(newSet === s) {
    Expect.fail("[:intersection():] has returned [:this:]");
  }

  newSet = s.intersection([1]);
  Expect.setEquals(s, [1, 2, 3]);
  if(newSet === s) {
    Expect.fail("[:intersection():] has returned [:this:]");
  }
}
