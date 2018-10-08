/*
 * Copyright (c) 2011-2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract E removeLast()
 * Removes and returns the last element of this queue.
 * @description Checks that exactly the last element is removed and returned.
 * @author msyabro
 */
library removeLast_A01_t01;

import "../../../Utils/expect.dart";
import "dart:collection";

test(Queue create([Iterable content])) {
  Queue queue = create();
  
  queue.addLast(1);
  queue.addLast("2");
  queue.addLast(true);

  Expect.isTrue(queue.length == 3);

  Expect.isTrue(queue.removeLast() == true);
  Expect.isTrue(queue.length == 2);
  Expect.isTrue(queue.last == "2");

  Expect.isTrue(queue.removeLast() == "2");
  Expect.isTrue(queue.length == 1);
  Expect.isTrue(queue.last == 1);

  Expect.isTrue(queue.removeLast() == 1);
  Expect.isTrue(queue.length == 0);

  queue = create();
  queue.addLast(1);
  queue.addLast(1);
  queue.addLast(1);

  Expect.isTrue(queue.length == 3);

  Expect.isTrue(queue.removeLast() == 1);
  Expect.isTrue(queue.length == 2);
  Expect.isTrue(queue.last == 1);

  Expect.isTrue(queue.removeLast() == 1);
  Expect.isTrue(queue.length == 1);
  Expect.isTrue(queue.last == 1);

  Expect.isTrue(queue.removeLast() == 1);
  Expect.isTrue(queue.length == 0);
}
