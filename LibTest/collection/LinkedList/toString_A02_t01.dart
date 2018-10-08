/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a string representation of this object.
 * If there are less than a hundred elements in the [iterable], it also contains
 * the last two elements.
 * @description Checks that string representation of this queue contains
 * representation of its last two elements if total element number is less than
 * hundred.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

void check(List elements) {
  LinkedList<MyLinkedListEntry> llist = toLinkedList(elements);
  String rep = llist.toString();

  Expect.isTrue(rep.contains(elements[elements.length - 1].toString()));
  Expect.isTrue(rep.contains(elements[elements.length - 2].toString()));
}

main() {
  check([1, "2", "345", "rfq"]);
  check([null, [null], [], [1, 2, 3], [[null]]]);
  check([1, "2", "345", "rfq"]);
  check([1, new Error(), 25, 4, null, "adc", null, 28, new Error(), 17, 8,
      new List()]);

  List aList = new List();
  for(int i = 0; i < 99; i++) aList.add(i);
  check(aList);
}
