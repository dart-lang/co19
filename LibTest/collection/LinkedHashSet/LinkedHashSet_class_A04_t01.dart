/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashSet<E> class implements Set<E>
 * Iteration of elements is done in element insertion order. An element that was
 * added after another will occur later in the iteration. Adding an element that
 * is already in the set does not change its position in the iteration order.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

checkOrder(LinkedHashSet set, List list) {
  Expect.equals(list.length, set.length);
  for(int i = 0; i < list.length; i++) {
    Expect.equals(list[i], set.elementAt(i));
  }
}

main() {
  LinkedHashSet set = new LinkedHashSet();
  List list = [];

  for (int i = 0; i < 100; i++) {
    set.add(i);
    list.add(i);
  }

  set.add(13);
  checkOrder(set, list);

  set.add(22);
  checkOrder(set, list);

  for (int i = 0; i < 100; i++) {
    set.add(i);
    checkOrder(set, list);
  }

  for (int i = 99; i >= 0; i--) {
    set.add(i);
    checkOrder(set, list);
  }
}
