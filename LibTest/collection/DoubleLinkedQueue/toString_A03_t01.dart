/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a string representation of this object.
 * If the resulting string isn't above 80 characters, more elements are included
 * from the start of the iterable.
 * @description Checks that string representation of this queue contains
 * representation of its last two elements if total element number is less than
 * hundred.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

bool check(List elements) {
  DoubleLinkedQueue q = new DoubleLinkedQueue.from(elements);
  String rep = q.toString();
  if (rep.length >= 80) {
    return false;
  } else {
    for (var element in elements) {
      Expect.isTrue(rep.contains(element.toString()));
    }
    return true;
  }
}

main() {
  check([1, "2", "345", "rfq"]);
  check([null, [null], [], [1, 2, 3], [[null]]]);
  check([1, "2", "345", "rfq"]);
  check([1, new Error(), 25, 4, null, "adc", null, 28, new Error(), 17, 8,
      new List()]);

  List aList = [null, "abcde", -4];
  int i = 15;
  do {
    aList.add(i++);
  } while(check(aList));
}
