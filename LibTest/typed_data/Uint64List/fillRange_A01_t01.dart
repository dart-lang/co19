/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void fillRange(int start, int end, [E fillValue])
 * Sets the objects in the range [start] inclusive to [end] exclusive to
 * the given fillValue.
 * @description Checks that the given range is filled with [fillValue].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Uint64List(1000);
  l.fillRange(0, 10, 1);
  for (int i = 0; i < 10; ++i) {
    Expect.equals(1, l[i]);
  }
  Expect.equals(0, l[10], "[end] should be exclusive");

  l.fillRange(100, 200, 55);
  for (int i = 100; i < 200; ++i) {
    Expect.equals(55, l[i]);
  }
  Expect.equals(0, l[200], "[end] should be exclusive");

  l.fillRange(0, 1000, 1);
  for (int i = 0; i < 1000; ++i) {
    Expect.equals(1, l[i]);
  }

  l.fillRange(0, 0, 2);
  for (int i = 0; i < 1000; ++i) {
    Expect.equals(1, l[i]);
  }
}
