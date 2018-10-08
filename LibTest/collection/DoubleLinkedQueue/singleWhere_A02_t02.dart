/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E singleWhere(bool test(E value))
 * Otherwise, if there are no matching elements, or if there is more than one
 * matching element, a [StateError] is thrown.
 * @description Checks that a [StateError] is thrown if more than one element
 * matches.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

check(List a, bool test(value)) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(a);
  Expect.throws(() { queue.singleWhere(test); }, (e) => e is StateError);
}

main() {
  check(const[ 1, 2, -5, -6, 1], (value) => value == 1);
  check([1, 2, -3, 4, -1], (value) => value < 0);
}
