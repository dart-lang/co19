/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addAll(Collection<T> collection)
 * Adds all the elements of the given collection to the set.
 * @description Passes an array containing an element with hashCode() function
 * returning string.
 * @dynamic-type-error
 * @author pagolubev
 * @reviewer msyabro
 */

class A {
  A() {}
  hashCode() { return 'ads'; }
}


main() {
  var s = new Set();
  s.addAll([new A()]);
}
