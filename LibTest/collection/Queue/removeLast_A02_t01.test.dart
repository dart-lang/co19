/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract E removeLast()
 * The queue must not be empty when this method is called.
 * @description Checks that exception is thrown if this queue is empty.
 * @author msyabro
 */
library removeLast_A02_t01;

import "../../../Utils/expect.dart";
import "dart:collection";

test(Queue create([Iterable content])) {
  Queue queue = create();

  Expect.throws(() { queue.removeLast(); }, (e) => e is StateError);
  
  queue.addLast(1);
  queue.addLast(2);
  queue.clear();

  Expect.throws(() { queue.removeLast(); }, (e) => e is StateError);
}
