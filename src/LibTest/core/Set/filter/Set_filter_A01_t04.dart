/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Collection<T> filter(bool f(T element));
 * Returns a new collection with the elements of this collection that satisfy the predicate [f].
 * We say that an element satisfies the predicate [f] if [:f(element):] returns true.
 * @description Nested filter().
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();
  s.addAll([1, -3, 10, 17]);

  Set<int> outer = new Set<int>();
  s.forEach(bool outerLoop(int x) {
    outer.add(x);
    Set<int> inner = new Set<int>();
    s.forEach(bool innerLoop(int y) {
      inner.add(y);
      return true;
    });
    Expect.isTrue(inner.containsAll(s));
    return true;
  });
  Expect.isTrue(outer.containsAll(s));
}
