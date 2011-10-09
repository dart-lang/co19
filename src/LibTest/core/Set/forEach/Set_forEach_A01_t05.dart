/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(T element))
 * Applies the function [f] to each element of the collection.
 * @description Checks that 'ObjectNotClosureException' is thrown
 * when a non-function object is passed to forEach().
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();
  s.addAll([1, 2]);

  try {
    s.forEach(null);
    Expect.fail("Expected ObjectNotClosureException.");
  } catch(ObjectNotClosureException e) {}

  int x;
  try {
    s.forEach(x);
    Expect.fail("Expected ObjectNotClosureException.");
  } catch(ObjectNotClosureException e) {}
}
