/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * void setInt16(
 *     int byteOffset,
 *     int value, [
 *     Endian endian = Endian.big
 * ])
 * Sets the two bytes starting at the specified [byteOffset] in this object to
 * the two's complement binary representation of the specified [value], which
 * must fit in two bytes.
 * In other words, [value] must lie between -pow(2, 15) and pow(2, 15) - 1,
 * inclusive.
 * @description Checks that the value at the [byteOffset] is set to [value].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var i16 = new Int16List(16);
  var valuesToBeSet = [
    123, -95, -25, 98, 0, 113, -20, -9, 1, 1, 24, -25, -69, -52, -125, 31
  ];
  var expectedBigEndian = [
    31488, -24065, -6145, 25088, 0, 28928, -4865, -2049, 256, 256, 6144,
    -6145, -17409, -13057, -31745, 7936
  ];
  int bytesInElement = Int16List.bytesPerElement;

  var byteDataFromI16 = new ByteData.view(i16.buffer);
  for (int i = 0; i < byteDataFromI16.lengthInBytes / bytesInElement; ++i) {
    byteDataFromI16.setInt16(i * bytesInElement, valuesToBeSet[i],
        Endian.little);
  }
  Expect.listEquals(valuesToBeSet, i16);

  for (int i = 0; i < byteDataFromI16.lengthInBytes / bytesInElement; ++i) {
    byteDataFromI16.setInt16(i * bytesInElement, valuesToBeSet[i]);
  }
  Expect.listEquals(expectedBigEndian, i16);
}
