/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * The result of this function is backed by [this].
 * @description Checks that the result of [getRange] is backed by [this].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Uint8ClampedList.fromList([0, 0, 0, 0, 0]);
  var res = l.getRange(0, 5);
  Expect.equals(0, res.elementAt(0));
  l[0] = 1;
  Expect.equals(1, res.elementAt(0));
}
