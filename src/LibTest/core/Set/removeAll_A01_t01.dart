/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeAll(Collection<T> collection)
 * Removes all the elements of the given collection from the set.
 * @description Checks that removeAll() works as specified in various simple scenarios.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();

  s.removeAll([]);
  Expect.isTrue(s.length == 0);

  s.removeAll([-1, 5, 0]);
  Expect.isTrue(s.length == 0);

  s.addAll([1, 19, -3, 8, -6, -2]);

  s.removeAll([]);
  Expect.isTrue(s.length == 6);
  Expect.isTrue(s.containsAll([1, 19, -3, 8, -6, -2]));

  s.removeAll([5, -6, 2, 19, 8, 8]);
  Expect.isTrue(s.length == 3);
  Expect.isTrue(s.containsAll([1, -3, -2]));
  Expect.isFalse(s.contains(-6));
  Expect.isFalse(s.contains(19));
  Expect.isFalse(s.contains(8));
  Expect.isFalse(s.contains(2));
}
