/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(T value)
 * Removes [value] from the set. Returns true if [value] was in the set.
 * Returns false otherwise. The method has no effect if [value] value was not in the set.
 * @description Check that set is correct after rehashing
 * @author msyabro
 */


main() {
  Set<int> s = new Set<int>();

  for(int i = 0; i < 1000; i++) {
    s.add(i);
  }

  for(int i = 0; i < 1000; i++) {
    s.remove(i);
    Expect.isTrue(!s.contains(i));
  }
}
