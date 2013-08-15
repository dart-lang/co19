/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0])
 * It is an error if [start].. [end] is not a valid range pointing into the [this].
 * @description Checks that it is an error if [start].. [end] is not
 * a valid range pointing into the [this].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Uint8ClampedList.fromList([0,0,0,0,0,0,0,0,0,0]);

  try {
    l.setRange(10, 1, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    Expect.fail("Error is expected");
  } catch(ok) {}

  try {
    l.setRange(-1, 1, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    Expect.fail("Error is expected");
  } catch(ok) {}

  try {
    l.setRange(1, 100, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    Expect.fail("Error is expected");
  } catch(ok) {}

  try {
    l.setRange(-2147483648, 2147483647, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    Expect.fail("Error is expected");
  } catch(ok) {}

}

