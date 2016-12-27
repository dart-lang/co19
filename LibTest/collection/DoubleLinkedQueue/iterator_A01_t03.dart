/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final _DoubleLinkedQueueIterator<E> iterator
 * Returns an Iterator that iterates over this Iterable object.
 * @description Checks that [Iterator] iterates over all elements from the list.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

void checkIterator(DoubleLinkedQueue list) {
  Iterator it = list.iterator;
  list.forEach((var element) {
    it.moveNext();
    Expect.equals(element, it.current);
  });
  Expect.isFalse(it.moveNext());
}

main() {
  checkIterator(new DoubleLinkedQueue());
  checkIterator(new DoubleLinkedQueue.from([null, 0, "1", false, []]));

  List a = new List(36547);
  for (var i = 0; i < a.length; i++) {
    a[i] = i;
  }
  checkIterator(new DoubleLinkedQueue.from(a));

  DoubleLinkedQueue l = new DoubleLinkedQueue();
  l.addAll(["0", "1", "2", "3", "4", "5"]);
  checkIterator(l);
}
