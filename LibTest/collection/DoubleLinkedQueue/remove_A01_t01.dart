/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(Object o)
 * Remove a single instance of [value] from the queue.
 * @description Checks that only single instance of value gets removed from the
 * queue and it does not affect another elements
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

check(List list, Object value, int num) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(list);
  int l1 = list.length;
  int cnt = 0;
  while(queue.remove(value)) {
    Expect.equals(l1 > 0 ? l1 - 1 : l1, queue.length);
    l1--;
    cnt++;
    int i = 0;
    queue.forEach((var element) {
      if(list[i] == value && list[i] != element) {
        list.removeAt(i);
      }
      Expect.equals(list[i++], element);
    });
  }
  Expect.equals(cnt, num);
}

main() {
  check([], 1, 0);
  check([1], 1, 1);
  check([1], 3, 0);
  check([1, 2, 3, 4, 5], 1, 1);
  check(new  List.from([2, 2, 1, 2]), 2, 3);
  check(new  List.from([2, 2, 1, 2]), 1, 1);
  check(new  List.from([1, 2, 1, 2, 8, 2, 13]), 2, 3);
  check(new  List.from([1, 2, "1", 2, "2", true, 8, 2, 13]), 2, 3);
  check(new  List.from(["1", 2, 1, "1", "abcd", 8, 2, false, 13]), "1", 2);
  check(new  List.from([1, 2, 1, 2, 8, 2, 13]), 13, 1);
  check(new  List.from([1, 2, 1, 2, 8, 2, 13]), 7, 0);
}
