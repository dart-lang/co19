/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(Object o)
 * Remove a single instance of value from the queue.
 * Returns true if a value was removed, or false if the queue contained no element equal to value.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

check(List list, Object value, bool expected) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  for (var element in list) {
    queue.add(element);
  }
  var l1=list.length;
  bool r = list.remove(value);
  Expect.isTrue(r is bool, "remove returned: ${r.runtimeType} ${r}, not bool");
  if (r) {
     Expect.isTrue(expected);
     Expect.equals(l1-1, list.length);
  } else {
     Expect.isFalse(expected);
     Expect.equals(l1, list.length);
  }
}

main() {
  check([], 1, false);
  check([1], 1, true);
  check(new List.from([]), true, false);
  List list=new List();
  check(list, 2, false);
  list.add(2);
  check(list, 2, true);
  check(list, 2, false);
}
