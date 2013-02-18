/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isSubsetOf(Collection<T> collection)
 * Returns true if [collection] contains all the elements of this collection.
 * @description Passes a list containing null elements to isSubsetOf(), expects no errors.
 * @author pagolubev
 * @reviewer msyabro
 */

main() {
  Set<int> s = new Set<int>();
  Expect.isTrue(s.isSubsetOf([null]));
  s.addAll([1, 2]);
  Expect.isFalse(s.isSubsetOf([null]));
}
