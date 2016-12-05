/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion element → E
 * read / write
 * The element in the queue.
 * @description Checks that element property is read/write
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  double d = 3.14;
  DoubleLinkedQueueEntry entry = new DoubleLinkedQueueEntry(d);
  Expect.equals(d, entry.element);

  int i = -1;
  entry.element = i;
  Expect.equals(i, entry.element);

  entry.element = null;
  Expect.isNull(entry.element);
}
