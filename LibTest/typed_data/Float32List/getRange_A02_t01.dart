/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * Returns an [Iterable] that iterates over the objects in the range [start]
 * inclusive to [end] exclusive.
 * @description Checks that returned Iterable iterates over the object, and
 * changes in object is visible in Iterable.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float32List.fromList([0.0, 0.0, 0.0, 0.0, 0.0]);
  var res = l.getRange(0, 5);
  Expect.equals(0.0, res.elementAt(0));
  l[0] = 1.0;
  Expect.equals(1.0, res.elementAt(0));
}
