/*
 * Copyright (c) 2011-2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract E removeFirst()
 * Removes and returns the first element of this queue.
 * @description Checks that exactly the first element is removed and returned.
 * @author msyabro
 */
library removeFirst_A01_t01;

import "../../../Utils/expect.dart";
import "dart:collection";

test(Queue create([Iterable content])) {
  Queue queue = create();
  
  queue.addLast(1);
  queue.addLast("2");
  queue.addLast(true);

  Expect.isTrue(queue.length == 3);

  Expect.isTrue(queue.removeFirst() == 1);
  Expect.isTrue(queue.length == 2);
  Expect.isTrue(queue.first == "2");

  Expect.isTrue(queue.removeFirst() == "2");
  Expect.isTrue(queue.length == 1);
  Expect.isTrue(queue.first == true);

  Expect.isTrue(queue.removeFirst() == true);
  Expect.isTrue(queue.length == 0);

  queue = create();
  queue.addLast(1);
  queue.addLast(1);
  queue.addLast(1);

  Expect.isTrue(queue.length == 3);

  Expect.isTrue(queue.removeFirst() == 1);
  Expect.isTrue(queue.length == 2);
  Expect.isTrue(queue.first == 1);

  Expect.isTrue(queue.removeFirst() == 1);
  Expect.isTrue(queue.length == 1);
  Expect.isTrue(queue.first == 1);

  Expect.isTrue(queue.removeFirst() == 1);
  Expect.isTrue(queue.length == 0);
}
