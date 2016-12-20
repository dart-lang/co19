/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasNext
 * @description Checks that [hasNext] returns [false] if iterator has no
 * elements to iterate
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  HasNextIterator i1 = new HasNextIterator([].iterator);
  Expect.isFalse(i1.hasNext);

  HasNextIterator i2 = new HasNextIterator([0].iterator);
  i2.next();
  Expect.isFalse(i2.hasNext);

  HasNextIterator i3 = new HasNextIterator([0, 1].iterator);
  i3.next();
  i3.next();
  Expect.isFalse(i3.hasNext);
}
