/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * void setUint16(
 *     int byteOffset,
 *     int value, [
 *     Endian endian = Endian.big
 * ])
 * Sets the two bytes starting at the specified [byteOffset] in this object to
 * the unsigned binary representation of the specified [value], which must fit
 * in two bytes.
 * In other words, [value] must be between 0 and pow(2, 16) - 1, inclusive.
 * @description Checks that the value at the [byteOffset] is set to [value].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var u16 = new Uint16List(16);
  var valuesToBeSet = [
    123, 95, 25, 98, 0, 113, 20, 9, 65535, 1, 24, 25, 69, 52, 125, 31
  ];
  var expectedBigEndian = [
    31488, 24320, 6400, 25088, 0, 28928, 5120, 2304, 65535, 256, 6144, 6400,
    17664, 13312, 32000, 7936
  ];
  int bytesInElement = Int16List.bytesPerElement;

  var byteDataFromU16 = new ByteData.view(u16.buffer);
  for (int i = 0; i < byteDataFromU16.lengthInBytes / bytesInElement; ++i) {
    byteDataFromU16.setUint16(i * bytesInElement, valuesToBeSet[i],
        Endian.little);
  }
  Expect.listEquals(valuesToBeSet, u16);

  for (int i = 0; i < byteDataFromU16.lengthInBytes / bytesInElement; ++i) {
    byteDataFromU16.setUint16(i * bytesInElement, valuesToBeSet[i]);
  }
  Expect.listEquals(expectedBigEndian, u16);
}
