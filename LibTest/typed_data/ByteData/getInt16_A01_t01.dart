/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * int getInt16(
 *     int byteOffset, [
 *     Endian endian = Endian.big
 * ])
 * Returns the (possibly negative) integer represented by the two bytes at
 * the specified [byteOffset] in this object, in two's complement binary form.
 * The return value will be between -pow(2, 15) and pow(2, 15) - 1, inclusive.
 * @description Checks that the correct value is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var i16 = new Int16List.fromList(
      [0, -1, 32767, -32768, 12, 54, 100, -23, 98, 23, 43, -15, -3]);
  var u32 = new Uint32List.fromList(
      [0x62e7a17b, 0xf7ec7100, 0xe7180101, 0x1f83ccbb]);
  int bytesInElement = Int16List.bytesPerElement;

  var byteDataFromI16 = new ByteData.view(i16.buffer);
  for (int i = 0; i < byteDataFromI16.lengthInBytes / bytesInElement; ++i) {
    Expect.equals(i16[i], byteDataFromI16.getInt16(i * bytesInElement,
        Endian.little));
  }

  var byteDataFromU32 = new ByteData.view(u32.buffer);
  var expectedBigEndian = [31649, -6302, 113, -4873, 257, 6375, -17460, -31969];
  var expectedLittleEndian = [
    -24197, 25319, 28928, -2068, 257, -6376, -13125, 8067
  ];
  for (int i = 0; i < byteDataFromU32.lengthInBytes / bytesInElement; ++i) {
    Expect.equals(expectedBigEndian[i],
        byteDataFromU32.getInt16(i * bytesInElement, Endian.big));
    Expect.equals(expectedLittleEndian[i],
        byteDataFromU32.getInt16(i * bytesInElement, Endian.little));
  }
}
