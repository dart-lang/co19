/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool E last
 * @description Checks that last is read-only property and cannot be changed
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  dynamic queue = new DoubleLinkedQueue();
  queue.add(1);
  queue.add(2);
  Expect.throws(() { queue.last = 1; }, (e) => e is NoSuchMethodError);
}
