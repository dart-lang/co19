/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasNext
 * @description Checks that [hasNext] returns [true] if iterator has next
 * element to iterate
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  HasNextIterator i1 = new HasNextIterator([1].iterator);
  Expect.isTrue(i1.hasNext);

  HasNextIterator i2 = new HasNextIterator([0, 1].iterator);
  Expect.isTrue(i2.hasNext);
}
