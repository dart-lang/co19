/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * void setInt32(
 *     int byteOffset,
 *     int value, [
 *     Endian endian = Endian.big
 * ])
 * ...
 * Throws [RangeError] if [byteOffset] is negative, or `byteOffset + 4` is
 * greater than the length of this object.
 * @description Checks that [RangeError] is thrown if [byteOffset] is negative.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var byteData = new ByteData(0);
  try {
    byteData.setInt32(-1, 0);
    Expect.fail("RangeError is expected");
  } on RangeError {}
}
