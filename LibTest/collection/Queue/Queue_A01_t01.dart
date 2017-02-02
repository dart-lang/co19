/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a queue.
 * @description Checks that empty queue is created.
 * @author msyabro
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Queue queue = new Queue();
  Expect.isTrue(queue.isEmpty);
}
