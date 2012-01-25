/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool some(bool f(T element))
 * Returns true if one element of the collection satisfies the predicate [f].
 * Returns false otherwise.
 * @description Checks that this method works as specified with a collection of integers
 * and a simple predicate (numerical comparison).
 * @author pagolubev
 * @needsreview Spec ambiguity: 'exactly one' or 'at least one'.
 * Implementation returns true when at least one element satisfies the predicate.
 * @reviewer msyabro
 */


main() {
  bool foo(int x) { return x > 0; }

  Set<int> s = new Set<int>();
  Expect.isTrue(!s.some(foo));

  s.addAll([-1, -3, -11]);
  Expect.isTrue(!s.some(foo));

  s.add(5);
  Expect.isTrue(s.some(foo));

  s.add(3);
  Expect.isTrue(s.some(foo));

  s.removeAll([3, 5]);
  Expect.isTrue(!s.some(foo));
}
