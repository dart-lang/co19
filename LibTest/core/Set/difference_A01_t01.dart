/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> difference(Set<E> other)
 * Returns a new set with the the elements of this that are not in other.
 * That is, the returned set contains all the elements of this Set that are not
 * elements of other according to other.contains.
 * @description Checks that a new set with the the elements of this that are not
 * in other
 * @author sgrekhov@unipro.ru
 */
library difference_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Iterable content])) {
  Set set = create([-1, 0, 1, 2, 3, 4, 5, 6]);
  Set other = create([ 4, 5, 6, 7, 8, 9, 10]);
  Set diff = set.difference(other);

  Expect.equals(5, diff.length);
  Expect.isTrue(diff.containsAll([-1, 0, 1, 2, 3]));
}

main() {
  test(create);
}
