/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addLast(E value)
 * Adds [value] at the end of the queue.
 * @description Checks that [value] is added to the end of the queue.
 * @author msyabro
 */
library addLast_A01_t01;

import "../../../Utils/expect.dart";
import "dart:collection";

test(Queue create([Iterable content])) {
  Queue queue = create();
  
  for (var i = 0; i <= 10000; i++) {
    queue.addLast(i);
    Expect.equals(i, queue.last);
    Expect.equals(i + 1, queue.length);
  }
}
