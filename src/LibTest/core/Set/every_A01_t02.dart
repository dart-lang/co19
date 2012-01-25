/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(T element))
 * Returns true if every element of the collection satisfies the predicate [f].
 * Returns false otherwise.
 * @description Checks that nested invocations of every() on the same set do not cause any errors.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();
  s.addAll([1, -3, 10, 17]);

  Set<int> outer = new Set<int>();
  s.every(bool outerLoop(int x) {
    outer.add(x);
    Set<int> inner = new Set<int>();
    s.every(bool innerLoop(int y) {
      inner.add(y);
      return true;
    });
    Expect.isTrue(inner.containsAll(s));
    return true;
  });
  Expect.isTrue(outer.containsAll(s));
}
