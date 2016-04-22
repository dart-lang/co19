/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion hashCode → int
 *  Get a hash code for this object.…
 *  read-only, inherited
 * @description Checks that hashCode is different for different elements
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  double d = 3.14;
  DoubleLinkedQueueEntry e1 = new DoubleLinkedQueueEntry(d);
  DoubleLinkedQueueEntry e2 = new DoubleLinkedQueueEntry(d);
  Expect.notEquals(e1.hashCode, e2.hashCode);

  int old = e1.hashCode;
  e1.element = -1;
  Expect.equals(old, e1.hashCode);
}
