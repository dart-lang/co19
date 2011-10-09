/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isSubsetOf(Collection<T> collection)
 * Returns true if [collection] contains all the elements of this collection.
 * @description Simple checks.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();

  Expect.isTrue(s.isSubsetOf([]));

  Expect.isTrue(s.isSubsetOf([1, -3]));

  s.addAll([1, -3, 6]);

  Expect.isTrue(!s.isSubsetOf([]));

  Expect.isTrue(!s.isSubsetOf([2, 7, 5]));

  Expect.isTrue(!s.isSubsetOf([-3, 1, 1]));

  Expect.isTrue(s.isSubsetOf([-3, 1, 6]));

  Expect.isTrue(s.isSubsetOf([6, 1, 6, 6, 1, -3]));
}
