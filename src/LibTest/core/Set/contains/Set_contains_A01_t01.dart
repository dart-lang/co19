/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(T value)
 * Returns true if [value] is in the set.
 * @description Checks that method returns true if an element was added to the set.
 * Otherwise returns false.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();

  int firstValue  = 27;
  int numValues = 19;
  for(int i = firstValue; i < firstValue + numValues; i++) {
    Expect.isTrue(!s.contains(i));
    s.add(i);
    Expect.isTrue(s.contains(i));
  }
}
