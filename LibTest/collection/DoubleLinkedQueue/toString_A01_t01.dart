/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a string representation of this object.
 * @description Checks that string representation of this queue contains
 * representation of its elements.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

void check(List elements) {
  DoubleLinkedQueue q = new DoubleLinkedQueue.from(elements);
  String rep = q.toString();
  
  for (var element in elements) {
    Expect.isTrue(rep.contains(element.toString()));
  }
}

main() {
  check([1, "2", "345", "rfq"]);
  check([null, [null], [], [1, 2, 3], [[null]]]);
}
