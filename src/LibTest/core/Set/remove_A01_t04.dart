/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(T value)
 * Removes [value] from the set. Returns true if [value] was in the set.
 * Returns false otherwise. The method has no effect if [value] value was not in the set.
 * @description Passes an element of type that doesn't implement the hashCode() function
 * as argument to remove(), expects a NoSuchMethodError.
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
    s.remove(new A());
    Expect.fail("Expected NoSuchMethodError.");
  } catch (NoSuchMethodError e) {
  }
}
