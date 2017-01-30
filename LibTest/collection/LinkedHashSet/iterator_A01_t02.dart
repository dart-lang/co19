/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Iterator<E> iterator
 * Provides an iterator that iterates over the elements in insertion order.
 * @description Checks that [Iterator] iterates over all elements from the set
 * in insertion mode.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

void checkIterator(LinkedHashSet set, List list) {
  Iterator it = set.iterator;
  list.forEach((var element) {
    it.moveNext();
    Expect.equals(element, it.current);
  });
  Expect.isFalse(it.moveNext());
}

main() {
  List list = [null, 0, 1, 2, "1", false, new Object(), []];
  LinkedHashSet set = new LinkedHashSet.from(list);

  checkIterator(set, list);

  set = new LinkedHashSet();
  list.clear();
  checkIterator(set, list);

  for (var i = 0; i < 150; i++) {
    list.add(i);
    set.add(i);
    checkIterator(set, list);
  }

  list = ["0", "1", "2", "3", "4", "5"];
  set.clear();
  set.addAll(["0", "1", "2", "3", "4", "5"]);
  checkIterator(set, list);
}
