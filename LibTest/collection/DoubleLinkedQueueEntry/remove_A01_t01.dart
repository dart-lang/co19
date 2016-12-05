/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion remove() → E
 * @description Checks that remove() removes element
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  queue.add(1);
  queue.add(2);
  queue.add(3);

  var e = queue.firstEntry().nextEntry().remove();
  Expect.equals(2, e);
  Expect.equals(2, queue.length);
  Expect.equals(1, queue.first);
  Expect.equals(3, queue.firstEntry().nextEntry().element);
  Expect.equals(1, queue.lastEntry().previousEntry().element);
}
