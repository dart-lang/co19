/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Gets the current element in the iteration.
 * @description Checks that the current element in the iteration is returned.
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
import "dart:collection";

void checkNext(Queue q) {
  Iterator it = q.iterator;
  var i = 0;
  q.forEach((var element) {
    Expect.isTrue(it.moveNext());
    Expect.equals(element, it.current);
    Expect.identical(it.current, it.current);
  });
}

main() {
  Queue q1 = new Queue.from([null,0,"1",false]);
  checkNext(q1);

  Queue q2 = new Queue();
  for (var i=0; i < 100; i++) {
    q2.add( -i);
  }
  checkNext(q2);

  Queue q3 = new Queue();
  q3.addAll(["0","1","2","3","4","5",6,7,8,9,null]);
  checkNext(q2);
}
