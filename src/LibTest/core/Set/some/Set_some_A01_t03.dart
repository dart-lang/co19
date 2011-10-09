/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool some(bool f(T element))
 * Returns true if one element of the collection satisfies the predicate [f].
 * Returns false otherwise.
 * @description Checks that 'ObjectNotClosureException' is thrown
 * when a non-function object is passed to some().
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();
  s.addAll([1, 2]);

  try {
    s.some(null);
    Expect.fail("Expected ObjectNotClosureException.");
  } catch(ObjectNotClosureException e) {}

  int x;
  try {
    s.some(x);
    Expect.fail("Expected ObjectNotClosureException.");
  } catch(ObjectNotClosureException e) {}
}
