/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addAll(Collection<T> collection)
 * Adds all the elements of the given collection to the set.
 * @description Checks addAll() behavior with collisions.
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
  Array a = [new A(7), new A(2), new A(-8), new A(2), new A(2)];
  s.addAll(a);
  Expect.isTrue(s.length == 3);
  Expect.isTrue(s.contains(new A(7)));
  Expect.isTrue(s.contains(new A(2)));
  Expect.isTrue(s.contains(new A(-8)));
}
