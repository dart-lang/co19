/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool containsAll(Collection<T> collection)
 * Returns true if this collection contains all the elements of [collection].
 * @description Some basic checks.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();

  Expect.isTrue(s.containsAll([]));
  Expect.isTrue(!s.containsAll([5, 2]));

  s.addAll([-1, 3, 7]);

  Expect.isTrue(s.containsAll([]));
  Expect.isTrue(s.containsAll([3]));
  Expect.isTrue(s.containsAll([-1, 7]));
  Expect.isTrue(s.containsAll([-1, 3, 7]));
  Expect.isTrue(!s.containsAll([1, 2]));
  Expect.isTrue(!s.containsAll([-1, 3, 7, 1]));
}
