/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setInt64(int byteOffset, int value, [Endianness endian = Endianness.BIG_ENDIAN])
 * Throws [RangeError] if [byteOffset] is negative, or
 * `byteOffset + 8` is greater than the length of this object.
 * @description Checks that [RangeError] is thrown if
 * `byteOffset + 8` is greater than the length of this object.
 * @issue 12880
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";


main() {
  var byteData = new ByteData(10);
  try {
    byteData.setInt64(3, 0);
    Expect.fail("RangeError is expected");
  } on RangeError catch(ok) {}

  try {
    byteData.setInt64(20, 0);
    Expect.fail("RangeError is expected");
  } on RangeError catch(ok) {}
}
