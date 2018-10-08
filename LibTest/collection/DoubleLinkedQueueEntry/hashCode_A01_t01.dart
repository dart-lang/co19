/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion hashCode → int
 * Get a hash code for this object.…
 * read-only, inherited
 * @description Checks that hashCode is constant in time even if element
 * is changed
 * @author a.semenov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "dart:math";
main() {
  DoubleLinkedQueueEntry d = new DoubleLinkedQueueEntry(pi);
  int hashCode = d.hashCode;
  for (Object o in [e, double.nan, -1, "hello", d]){
    d.element = o;
    Expect.equals(hashCode, d.hashCode);
  }
}
