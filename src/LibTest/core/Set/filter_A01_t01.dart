/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Collection<T> filter(bool f(T element));
 * Returns a new collection with the elements of this collection that satisfy the predicate [f].
 * An element satisfies the predicate [f] if [:f(element):] returns true.
 * @description Checks that filter() invocation does not change the set by itself
 * and contents of the returned collection are the same as expected.
 * @author pagolubev
 * @reviewer msyabro
 */


void checkInitial(Set<int> initial) {
  Expect.isTrue(initial.length == 5);
  Expect.isTrue(initial.containsAll([1, 2, 3, 4, 5]));
}

main() {
  Set<int> initial = new Set<int>();
  initial.addAll([1, 2, 3, 4, 5]);

  Collection<int> filtered = initial.filter(bool even(int e) { return e % 2 == 0; });
  checkInitial(initial);
  Expect.isTrue(filtered.length == 2);
  Expect.isTrue(filtered.containsAll([2, 4]));

  Collection<int> filtered2 = initial.filter(bool all(int e) { return true; });
  checkInitial(initial);
  Expect.isTrue(filtered2.length == 5);
  Expect.isTrue(filtered2.containsAll([1, 2, 3, 4, 5]));

  Collection<int> filtered3 = initial.filter(bool all(int e) { return false; });
  checkInitial(initial);
  Expect.isTrue(filtered3.isEmpty());
}
