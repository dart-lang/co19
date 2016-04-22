/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion new DoubleLinkedQueueEntry()
 * Creates a DoubleLinkedQueueEntry object
 * @description Checks that DoubleLinkedQueueEntry with correct element is
 * created.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  double d = 3.14;
  DoubleLinkedQueueEntry entry = new DoubleLinkedQueueEntry(d);
  Expect.isTrue(entry is DoubleLinkedQueueEntry);
  Expect.equals(d, entry.element);
}
