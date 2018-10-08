/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool containsAll(Collection<T> collection)
 * Returns true if this collection contains all the elements of [collection].
 * @description Checks that this method returns true if all element from the
 * argument collection were added to the set prior to that (and not removed
 * since) and false otherwise.
 * @author pagolubev
 */
library containsAll_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();

  Expect.isTrue(s.containsAll([]));
  Expect.isFalse(s.containsAll([5, 2]));

  s.addAll([-1, 3, 7]);

  Expect.isTrue(s.containsAll([]));
  Expect.isTrue(s.containsAll([3]));
  Expect.isTrue(s.containsAll([-1, 7]));
  Expect.isTrue(s.containsAll([-1, 3, 7]));
  Expect.isFalse(s.containsAll([1, 2]));
  Expect.isFalse(s.containsAll([-1, 3, 7, 1]));
}

main() {
  test(create);
}
