/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion new ListQueue([int initialCapacity])
 * Create an empty queue.
 * If [initialCapacity] is given, prepare the queue for at least that many
 * elements.
 * @description Checks that empty queue is created.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  ListQueue list = new ListQueue();
  Expect.isTrue(list.isEmpty);
  list = new ListQueue(1);
  Expect.isTrue(list.isEmpty);
}
