/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool containsAll(Collection<T> collection)
 * Returns true if this collection contains all the elements of [collection].
 * @description Passes a list containing null elements as argument, expects
 * no errors.
 * @author pagolubev
 */
library containsAll_A01_t02;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();
  Expect.isFalse(s.containsAll([null]));
  Expect.isFalse(s.containsAll([1, 2, null]));

  s.addAll([1, 2]);
  Expect.isFalse(s.containsAll([null]));
  Expect.isFalse(s.containsAll([1, 2, null]));
}

main() {
  test(create);
}
