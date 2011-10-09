/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Collection<T> filter(bool f(T element));
 * Returns a new collection with the elements of this collection that satisfy the predicate [f].
 * We say that an element satisfies the predicate [f] if [:f(element):] returns true.
 * @description Passes to filter() a function that modifies an element.
 * @author pagolubev
 * @needsreview Set behaviour when elements are modified while iterating
 * with filter() is not specified. Currently element modification does
 * not change its position in the hash table.
 */

class A {
  A(this.x) {}
  bool operator==(A other) { return x == other.x; }
  int hashCode() { return x; }
  int x;
}


main() {
  Set<A> s = new Set<A>();
  s.addAll([new A(1), new A(-1)]);

  bool foo(A a) {
    a.x *= 2;
    return true;
  }

  Set<A> filtered = s.filter(foo);

  Expect.isTrue(s.length == 2);
  Expect.isTrue(s.contains(new A(2)));
  Expect.isTrue(s.contains(new A(-2)));

  Expect.isTrue(filtered.length == 2);
  Expect.isTrue(filtered.contains(new A(2)));
  Expect.isTrue(filtered.contains(new A(-2)));
}
