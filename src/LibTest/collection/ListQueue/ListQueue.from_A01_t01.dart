/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory ListQueue.from(Iterable<E> source)
 * Create a queue initially containing the elements of [source].
 * @description Checks that created list contains all elements of [source] collection.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

void check(ListQueue l, Iterable c) {
  Expect.isTrue(l.length == c.length);
  c.forEach((var element) {
    Expect.isTrue(l.removeFirst() == element);
  });
}

main() {
  ListQueue<int> list = new ListQueue.from([1, 2, 3, 4, 5]);
  check(list, [1, 2, 3, 4, 5]);
  
  Set set = new Set.from([1, 2, 3, 4, 5]);
  list = new ListQueue.from(set);
  check(list, set);
  
  ListQueue tmp = new ListQueue();
  tmp.addLast(1);
  tmp.addLast(2);
  list = new ListQueue.from(tmp);
  check(list, tmp);
  
  list = new ListQueue.from(new ListQueue());
  check(list, []);
  
  list = new ListQueue.from([tmp, tmp, set]);
  check(list, [tmp, tmp, set]);
  
  list = new ListQueue.from(new Set());
  check(list, []);
}
