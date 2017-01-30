/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashSet<E> class implements Set<E>
 * The [LinkedHashSet] also keep track of the order that elements were inserted
 * in, and iteration happens in first-to-last insertion order.
 * @description Checks that [LinkedHashSet] preserves insertion order for its
 * elements.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

checkOrder(LinkedHashSet set, List list, dynamic value) {
  set.add(value);
  list.add(value);
  int i = 0;
  for(var k in set) {
    Expect.equals(list[i++], k);
  }
}

main() {
  LinkedHashSet set = new LinkedHashSet();
  List list = new List();
  checkOrder(set, list, 0);
  checkOrder(set, list, 2);
  checkOrder(set, list, "test");
  checkOrder(set, list, "test1");
  checkOrder(set, list, -23);
  checkOrder(set, list, 4);
  checkOrder(set, list, []);
  checkOrder(set, list, 15);
  checkOrder(set, list, new Object());
}
