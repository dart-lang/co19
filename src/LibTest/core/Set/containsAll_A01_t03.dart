/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool containsAll(Collection<T> collection)
 * Returns true if this collection contains all the elements of [collection].
 * @description Passes a list containing elements of type that doesn't implement
 * hashCode() function, expects NoSuchMethodError.
 * @author pagolubev
 * @reviewer msyabro
 */

class A {
  A() {}
}


main() {
  var s = new Set();
  s.addAll([1, 2]);
  try {
    s.removeAll([1, 2, new A()]);
    Expect.fail("Expected NoSuchMethodError.");
  } on NoSuchMethodError catch(e) {
  }
}
