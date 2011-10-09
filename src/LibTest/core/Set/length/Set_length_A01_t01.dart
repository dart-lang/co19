/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int length
 * Returns the number of elements in the collection.
 * @description Checks number returned by length.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();
  Expect.isTrue(s.length == 0);

  int n = 20;
  for(int i = 0; i < n; i++) {
    Expect.isTrue(s.length == i);
    s.add(i);
  }
  Expect.isTrue(s.length == n);

  s.clear();
  Expect.isTrue(s.length == 0);
}
