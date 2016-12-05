/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isNotEmpty
 * Returns [true] if there is at least one element in this collection.
 * @description Checks that method returns [true] only if queue is not empty.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue list = new DoubleLinkedQueue();
  
  Expect.isFalse(list.isNotEmpty);
  
  list.addLast(1);
  Expect.isTrue(list.isNotEmpty);
  Expect.isTrue(list.isNotEmpty);
  Expect.isTrue(list.isNotEmpty);

  list.addFirst(1);
  Expect.isTrue(list.isNotEmpty);
  
  list.removeFirst();
  Expect.isTrue(list.isNotEmpty);
  list.removeFirst();
  Expect.isFalse(list.isNotEmpty);
  Expect.isFalse(list.isNotEmpty);
}
