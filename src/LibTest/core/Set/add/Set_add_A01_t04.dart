/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(T value)
 * Adds [value] into the set. The method has no effect if [value] was already in the set.
 * @description Tries to add an element of type that doesn't implement hashCode() method to the set,
 * NoSuchMethodException is expected.
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
    Expect.fail("NoSuchMethodException expected.");
  } catch (NoSuchMethodException e) {
  }
}
