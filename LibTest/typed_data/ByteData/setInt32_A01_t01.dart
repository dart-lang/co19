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
 * Sets the four bytes starting at the specified [byteOffset] in this object to
 * the two's complement binary representation of the specified [value], which
 * must fit in four bytes.
 * In other words, [value] must lie between -pow(2, 31) and pow(2, 31) - 1,
 * inclusive.
 * @description Checks that the value at the [byteOffset] is set to [value].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var i32 = new Int32List(16);
  var valuesToBeSet = [
    123, -95, -25, 98, 0, 113, -20, -9, 1, 2147483647, -2147483648,
    -25, -69, -52, -125, 31
  ];
  var expectedBigEndian = [
    2063597568, -1577058305, -402653185, 1644167168, 0, 1895825408,
    -318767105, -134217729, 16777216, -129, 128, -402653185, -1140850689,
    -855638017, -2080374785, 520093696
  ];
  int bytesInElement = Int32List.bytesPerElement;

  var byteDataFromI32 = new ByteData.view(i32.buffer);
  for (int i = 0; i < byteDataFromI32.lengthInBytes / bytesInElement; ++i) {
    byteDataFromI32.setInt32(i * bytesInElement, valuesToBeSet[i],
        Endian.little);
  }
  Expect.listEquals(valuesToBeSet, i32);

  for (int i = 0; i < byteDataFromI32.lengthInBytes / bytesInElement; ++i) {
    byteDataFromI32.setInt32(i * bytesInElement, valuesToBeSet[i]);
  }
  Expect.listEquals(expectedBigEndian, i32);
}
