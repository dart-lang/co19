/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * void setInt64(
 *     int byteOffset,
 *     int value, [
 *     Endian endian = Endian.big
 * ])
 * Sets the eight bytes starting at the specified [byteOffset] in this object to
 * the two's complement binary representation of the specified [value], which
 * must fit in eight bytes.
 * In other words, [value] must lie between -pow(2, 63) and pow(2, 63) - 1,
 * inclusive.
 * @description Checks that the value at the [byteOffset] is set to [value].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var i64 = new Int64List(16);
  var valuesToBeSet = [
    123, -95, -25, 98, 0, 113, -20, -9, 1, 9223372036854775807,
    -9223372036854775808, -25, -69, -52, -125, 31
  ];
  var expectedBigEndian = [
    8863084066665136128, -6773413839565225985, -1729382256910270465,
    7061644215716937728, 0, 8142508126285856768, -1369094286720630785,
    -576460752303423489, 72057594037927936, -129, 128, -1729382256910270465,
    -4899916394579099649, -3674937295934324737, -8935141660703064065,
    2233785415175766016
  ];
  int bytesInElement = Int64List.bytesPerElement;

  var byteDataFromI64 = new ByteData.view(i64.buffer);
  for (int i = 0; i < byteDataFromI64.lengthInBytes / bytesInElement; ++i) {
    byteDataFromI64.setInt64(i * bytesInElement, valuesToBeSet[i],
        Endian.little);
  }
  Expect.listEquals(valuesToBeSet, i64);

  for (int i = 0; i < byteDataFromI64.lengthInBytes / bytesInElement; ++i) {
    byteDataFromI64.setInt64(i * bytesInElement, valuesToBeSet[i]);
  }
  Expect.listEquals(expectedBigEndian, i64);
}
