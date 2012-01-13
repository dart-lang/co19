/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isSubsetOf(Collection<T> collection)
 * Returns true if [collection] contains all the elements of this collection.
 * @description Passes a list containing null elements to isSubsetOf(), expects NullPointerException.
 * @author pagolubev
 * @needsreview Behavior is not specified. Assuming a NullPointerException should be thrown.
 * @reviewer msyabro
 */


void check(Set<int> s) {
  try {
    s.isSubsetOf([null]);
    Expect.fail("Expected NullPointerException.");
  } catch (NullPointerException e) {}

  try {
    s.isSubsetOf([1, 2, null]);
    Expect.fail("Expected NullPointerException.");
  } catch (NullPointerException e) {}
}

main() {
  Set<int> s = new Set<int>();
  check(s);
  s.addAll([1, 2]);
  check(s);
}
