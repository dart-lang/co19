/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(T value)
 * Removes [value] from the set. Returns true if [value] was in the set.
 * Returns false otherwise. The method has no effect if [value] value was not in the set.
 * @description Checks that items with the same hash code are removed correctly by this method.
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
  Set<A> s = new Set<A>();
  s.addAll([new A(-3), new A(0), new A(7)]);

  Expect.isTrue(s.remove(new A(0)));
  Expect.isTrue(s.length == 2);
  Expect.isTrue(s.containsAll([new A(-3), new A(7)]));
  Expect.isFalse(s.contains(new A(0)));

  Expect.isTrue(s.remove(new A(7)));
  Expect.isTrue(s.length == 1);
  Expect.isTrue(s.contains(new A(-3)));
  Expect.isFalse(s.contains(new A(7)));

  Expect.isTrue(s.remove(new A(-3)));
  Expect.isTrue(s.length == 0);
  Expect.isFalse(s.contains(new A(-3)));
}
