/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeAll(Collection<T> collection)
 * Removes all the elements of the given collection from the set.
 * @description Passes an element w/o hashCode() function to remove().
 * @author pagolubev
 * @reviewer msyabro
 */

class A {
  A() {}
}


main() {
  Set s = new Set();
  s.addAll([1, 2, 3]);
  try {
    s.removeAll([1, 2, new A()]);
    Expect.fail("Expected NoSuchMethodException.");
  } catch (NoSuchMethodException e) {
  }
}
