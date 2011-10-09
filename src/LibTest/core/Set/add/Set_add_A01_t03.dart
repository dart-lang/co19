/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(T value)
 * Adds [value] into the set. The method has no effect if [value] was already in the set.
 * @description Checks add() with collisions.
 * @author pagolubev
 * @reviewer msyabro
 */

class A {
  A(this.x) {}
  bool operator==(A other) { return x == other.x; }
  int hashCode() { return -1; }
  int x;
}


main() {
  Set<int> s = new Set<int>();

  int firstValue  = 27;
  int numValues = 19;
  for(int i = firstValue; i < firstValue + numValues; i++) {
    s.add(new A(i));
    int expectedSize = i - firstValue + 1;
    Expect.isTrue(s.contains(new A(i)));
    Expect.isTrue(s.length == expectedSize);

    s.add(new A(i));
    Expect.isTrue(s.length == expectedSize);
    Expect.isTrue(s.contains(new A(i)));
  }
}
