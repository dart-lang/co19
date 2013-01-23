/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a [Queue] that contains all elements of
 * [other].
 * @description Checks that created list contains all elements of [other] collection.
 * @author msyabro
 * @reviewer varlax
 */
import "dart:collection";

void check(Queue l, Collection c) {
  Expect.isTrue(l.length == c.length);
  c.forEach((var element) {
    Expect.isTrue(l.removeFirst() == element);
  });
}

main() {
  Queue<int> list = new Queue.from([1, 2, 3, 4, 5]);
  check(list, [1, 2, 3, 4, 5]);
  
  Set set = new Set.from([1, 2, 3, 4, 5]);
  list = new Queue.from(set);
  check(list, set);
  
  Queue tmp = new Queue();
  tmp.addLast(1);
  tmp.addLast(2);
  list = new Queue.from(tmp);
  check(list, tmp);
  
  list = new Queue.from(new Queue());
  check(list, []);
  
  list = new Queue.from([tmp, tmp, set]);
  check(list, [tmp, tmp, set]);
  
  list = new Queue.from(new Set());
  check(list, []);
}
