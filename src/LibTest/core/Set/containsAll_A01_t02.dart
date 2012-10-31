/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool containsAll(Collection<T> collection)
 * Returns true if this collection contains all the elements of [collection].
 * @description Passes a list containing null elements as argument, expects
 * NullPointerException as long as the null value in the list is not preceded by others
 * this set doesn't contain.
 * @author pagolubev
 * @needsreview Undocumented
 * @reviewer msyabro
 */


void check1(Set<int> s) {
  try {
    s.containsAll([null]);
    Expect.fail("NPE expected");
  } on NullPointerException catch(e) {}
}

void check2(Set<int> s) {
  try {
    s.containsAll([1, 2, null]);
    Expect.fail("NPE expected");
  } on NullPointerException catch(e) {}
}

main() {
  Set<int> s = new Set<int>();
  check1(s);

  s.addAll([1, 2]);
  check1(s);
  check2(s);
}
