/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isNotEmpty
 * May be computed by checking if [iterator.moveNext()] returns [true].
 * @description Checks that method returns true only if queue is not empty.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue list = new DoubleLinkedQueue();
  Expect.equals(list.isNotEmpty, list.iterator.moveNext());
  list.addLast(1);
  Expect.equals(list.isNotEmpty, list.iterator.moveNext());
  list.addFirst(1);
  Expect.equals(list.isNotEmpty, list.iterator.moveNext());
  list.removeFirst();
  Expect.equals(list.isNotEmpty, list.iterator.moveNext());
  list.removeFirst();
  Expect.equals(list.isNotEmpty, list.iterator.moveNext());
}
