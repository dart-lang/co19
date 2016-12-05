/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion append(E e) → void
 * Appends the given [e] as entry just after this entry.
 * @description Checks that [append()] appends element to this queue
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueueEntry e = new DoubleLinkedQueueEntry(1);
  e.append(2);

  Expect.equals(2, e.nextEntry().element);
  Expect.isNull(e.previousEntry());
}
