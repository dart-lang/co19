/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(T value)
 * Adds [value] into the set. The method has no effect if [value] was already in the set.
 * @description Checks that elements with the same hash code that are not equal according
 * to == operator do not replace each other when added to the set but those that are equal
 * replace each other.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
 */

class A {
  A(this.x) {}
  bool operator==(A other) { return x == other.x; }
  int hashCode() { return -1; }
  int x;
}


main() {
  Set s = new Set();

  int numValues = 19;
  for(int i = 0; i < numValues; i++) {
    s.add(new A(i));
    int expectedSize = i + 1;
    Expect.isTrue(s.contains(new A(i)));
    Expect.isTrue(s.length == expectedSize);

    s.add(new A(i));
    Expect.isTrue(s.length == expectedSize);
    Expect.isTrue(s.contains(new A(i)));
  }
}
