/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(T value)
 * Adds [value] into the set. The method has no effect if [value] was already in the set.
 * @description Adds an element of type w/o hashCode() method.
 * @author pagolubev
 * @reviewer msyabro
 */

class A {
  A() {}
}


main() {
  Set<A> s = new Set<A>();
  try {
    s.add(new A());
    Expect.fail("Expected NoSuchMethodException.");
  } catch (NoSuchMethodException e) {
  }
}
