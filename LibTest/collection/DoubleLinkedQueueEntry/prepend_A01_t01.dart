/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion prepend(E e) → void
 * Prepends the given [e] as entry just before this entry.
 * @description Checks that [prepend()] adds element before this one
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueueEntry e = new DoubleLinkedQueueEntry(1);
  e.prepend(2);

  Expect.equals(2, e.previousEntry().element);
  Expect.isNull(e.nextEntry());
}
