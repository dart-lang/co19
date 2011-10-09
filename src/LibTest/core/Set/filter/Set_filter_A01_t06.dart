/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Collection<T> filter(bool f(T element));
 * Returns a new collection with the elements of this collection that satisfy the predicate [f].
 * We say that an element satisfies the predicate [f] if [:f(element):] returns true.
 * @description Try to pass a function with empty parameter list to filter().
 * @dynamic-type-error
 * @author pagolubev
 * @needsreview java crash
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();
  s.addAll([1, 2]);

  s.forEach(bool f() { return true; });
}
