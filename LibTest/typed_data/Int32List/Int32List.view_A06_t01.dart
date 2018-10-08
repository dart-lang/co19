/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Int32List.view(
 *     ByteBuffer buffer, [
 *     int offsetInBytes = 0,
 *     int length
 * ])
 * ...
 * Throws [ArgumentError] if [offsetInBytes] is not a multiple of
 * BYTES_PER_ELEMENT.
 * @description Checks that [ArgumentError] is thrown if [offsetInBytes] is
 * not a multiple of BYTES_PER_ELEMENT.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var list = new Int32List(2);
  var buffer = list.buffer;
  for (int i = 1; i < Int32List.bytesPerElement; ++i) {
    try {
      new Int32List.view(buffer, i);
      Expect.fail("ArgumentError is expected");
    } on ArgumentError {}
  }
}
