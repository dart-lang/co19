/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool containsAll(Collection<T> collection)
 * Returns true if this collection contains all the elements of [collection].
 * @description Passes a list containing null elements as argument, expects NullPointerException.
 * @author pagolubev
 * @needsreview Undocumented
 * @reviewer msyabro
 */


void check(Set<int> s) {
  try {
    s.containsAll([null]);
  } catch (NullPointerException e) {}

  try {
    s.containsAll([1, 2, null]);
  } catch (NullPointerException e) {}
}

main() {
  Set<int> s = new Set<int>();
  check(s);
  s.addAll([1, 2]);
  check(s);
}
