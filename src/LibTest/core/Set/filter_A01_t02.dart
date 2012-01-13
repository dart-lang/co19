/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Collection<T> filter(bool f(T element));
 * Returns a new collection with the elements of this collection that satisfy the predicate [f].
 * An element satisfies the predicate [f] if [:f(element):] returns true.
 * @description Checks that filter() can be invoked on an empty set without any errors.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();

  int i = 0;
  bool foo(int x) {
    i++;
    return true;
  }

  Expect.isTrue(s.filter(foo).isEmpty());
  Expect.isTrue(i == 0);
}
