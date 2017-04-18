/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ByteData(int length)
 * Creates a [ByteData] of the specified length (in elements), all of whose bytes
 * are initially zero.
 * @description Checks that an instance of [ByteData] of the specified length
 * is created.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(int length) {
  var l = new ByteData(length);
  Expect.isTrue(l is ByteData);
  Expect.equals(l.lengthInBytes, length);
}

main() {
  check(0);
  check(1);
  check(10);
  check(1024);
  check(2048);
}
