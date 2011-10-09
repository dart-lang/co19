/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(T element))
 * Returns true if every elements of the collection satisify the predicate [f].
 * Returns false otherwise.
 * @description Passes function with return type void to every().
 * @dynamic-type-error
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();
  s.addAll([1, 2]);
  s.every(void foo(int i) {});
}
