/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeAll(Collection<T> collection)
 * Removes all the elements of the given collection from the set.
 * @description Passes a list containing null as argument to removeAll(), expects a NullPointerException.
 * @author pagolubev
 * @needsreview Behavior not specified. Assumes a NullPointerException should be thrown.
 * @reviewer msyabro
 */


void check(Set<int> s) {
  try {
    s.removeAll([null]);
    Expect.fail("Expected NullPointerException.");
  } catch (NullPointerException e) {}

  try {
    s.removeAll([1, 2, null]);
    Expect.fail("Expected NullPointerException.");
  } catch (NullPointerException e) {}
}

main() {
  Set<int> s = new Set<int>();
  check(s);
  s.addAll([1, 2]);
  check(s);
}
