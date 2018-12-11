/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionfactory DoubleLinkedQueue.from(Iterable elements)
 * Creates a double-linked queue containing all elements.
 * The element order in the queue is as if the elements were added using
 * addLast in the order provided by elements.iterator.
 * @description Checks that created list contains all elements of [elements]
 * collection.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

void check(DoubleLinkedQueue l, Iterable c) {
  Expect.isTrue(l.length == c.length);
  c.forEach((var element) {
    Expect.isTrue(l.removeFirst() == element);
  });
}

main() {
  DoubleLinkedQueue list = new DoubleLinkedQueue.from([1, 2, 3, 4, 5]);
  check(list, [1, 2, 3, 4, 5]);
  
  Set set = new Set.from([1, 2, 3, 4, 5]);
  list = new DoubleLinkedQueue.from(set);
  check(list, set);
  
  DoubleLinkedQueue tmp = new DoubleLinkedQueue();
  tmp.addLast(1);
  tmp.addLast(2);
  list = new DoubleLinkedQueue.from(tmp);
  check(list, tmp);
  
  list = new DoubleLinkedQueue.from(new DoubleLinkedQueue());
  check(list, []);

  list = new DoubleLinkedQueue.from([tmp, tmp, set]);
  check(list, [tmp, tmp, set]);
  
  list = new DoubleLinkedQueue.from(new Set());
  check(list, []);
}
