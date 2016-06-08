/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> union(Set<E> other)
 * Returns a new set which contains all the elements of this set and other.
 *
 * That is, the returned set contains all the elements of this Set and all the
 * elements of other.
 * @description Checks that the returned set contains all the elements of this
 * Set and all the elements of other.
 * @author sgrekhov@unipro.ru
 */
library union_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

void check(Set set, Set other, Iterable expected) {
  Set test = set.union(other);
  Expect.equals(expected.length, test.length);
  Expect.isTrue(test.containsAll(expected));
}

test(Set create([Iterable content])) {
  check(create([]), create([]), []);
  check(create([]), create([1, 2, 4, 5, 7]), [1, 2, 4, 5, 7]);
  check(create([1, 2, 4, 5, 7]), create([]), [1, 2, 4, 5, 7]);
  check(create([1, 3, 3, 4, 5, 6]), create([1, 2, 4, 5, 7]),
      [1, 2, 3, 4, 5, 6, 7]);
}

main() {
  test(create);
}
