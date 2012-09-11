/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addAll(Collection<T> collection)
 * Adds all the elements of the given collection to the set.
 * @description Passes a list containing an element of type that doesn't implement hashCode() method,
 * expects NoSuchMethodError.
 * @author pagolubev
 * @reviewer msyabro
 */

class A {
  A() {}
}


main() {
  var s = new Set();
  try {
    s.addAll([1, 2, new A()]);
    Expect.fail("Expected NoSuchMethodError.");
  } catch (NoSuchMethodError e) {
  }
}
