/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a string representation of this object.
 * @description Checks that result string is correct.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

class MyIterable<int> extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

void check(List elements) {
  IterableMixin q = new MyIterable(elements);
  String rep = q.toString();
  
  Expect.isTrue(rep.contains(elements[0].toString()));
  Expect.isTrue(rep.contains(elements[1].toString()));
  Expect.isTrue(rep.contains(elements[2].toString()));
}

main() {
  check([1, "2", "345", "rfq"]);
  check([null, [null], [], [1, 2, 3], [[null]]]);
  check([1, "2", "345", "rfq"]);
  check([1, new Error(), 25, 4, null, "adc", null, 28, new Error(), 17, 8, 5]);

  List aList = new List();
  for(int i = 0; i < 99; i++) aList.add(i);
  check(aList);

  for(int i = 99; i < 500; i++) aList.add(i);
  check(aList);
}
