/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(T value)
 * Adds [value] into the set. The method has no effect if [value] was already in the set.
 * @description Checks that the set is correct after rehashing.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();

  s.addAll([-1, -3, -2, -5, -6]);
  Expect.isTrue(s.length == 5);
  Expect.isTrue(s.containsAll([-1, -3, -2, -5, -6]));

  Array a = [-1, -3, -2, -5, -6];
  for(int i = 0; i < 1000; i++) {
    s.add(i);
    Expect.isTrue(s.contains(i));
    Expect.isTrue(s.containsAll(a));
    Expect.isTrue(s.length == 6 + i);
  }

}
