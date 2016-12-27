/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E reduce(E combine(E value, E element))
 * The iterable must have at least one element.
 * @description Checks that error state exception is thrown if queue is empty.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

test (combine, element) {
  return combine + element;
}

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  Expect.throws(() { queue.reduce(test); }, (e) => e is StateError);
}
