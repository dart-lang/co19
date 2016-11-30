/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Gets the current element in the iteration.
 * @description Checks that the current element in the iteration is returned.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

void checkNext(DoubleLinkedQueue q) {
  Iterator it = q.iterator;
  q.forEach((var element) {
    Expect.isTrue(it.moveNext());
    Expect.equals(element, it.current);
    Expect.identical(it.current, it.current);
  });
}

main() {
  DoubleLinkedQueue q1 = new DoubleLinkedQueue.from([null, 0, "1", false]);
  checkNext(q1);

  DoubleLinkedQueue q2 = new DoubleLinkedQueue();
  for (var i = 0; i < 100; i++) {
    q2.add( -i);
  }
  checkNext(q2);

  DoubleLinkedQueue q3 = new DoubleLinkedQueue.from(
      ["0", "1", "2", "3", "4", "5", 6, 7, 8, 9, null]);
  checkNext(q3);
}
