/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion new DoubleLinkedQueueEntry()
 * Creates a DoubleLinkedQueueEntry object
 * @description Checks that DoubleLinkedQueueEntry with null element is
 * created.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueueEntry entry = new DoubleLinkedQueueEntry(null);
  Expect.isTrue(entry is DoubleLinkedQueueEntry);
  Expect.isNull(entry.element);
}
