/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * int getUint16(
 *     int byteOffset, [
 *     Endian endian = Endian.big
 * ])
 * Returns the positive integer represented by the two bytes starting at the
 * specified [byteOffset] in this object, in unsigned binary form.
 * The return value will be between 0 and pow(2, 16) - 1, inclusive.
 * @description Checks that the correct value is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var u16 = new Uint16List.fromList(
      [0, 1, 65535, 32768, 12, 54, 100, 23, 98, 23, 43, 15, 3]);
  var u32 = new Uint32List.fromList(
      [0x62e7a17b, 0xf7ec7100, 0xe7180101, 0x1f83ccbb]);
  int bytesInElement = Uint16List.bytesPerElement;

  var byteDataFromU16 = new ByteData.view(u16.buffer);
  for (int i = 0; i < byteDataFromU16.lengthInBytes / bytesInElement; ++i) {
    Expect.equals(u16[i],
        byteDataFromU16.getUint16(i * bytesInElement,
            Endian.little));
  }

  var byteDataFromU32 = new ByteData.view(u32.buffer);
  var expectedBigEndian = [31649, 59234, 113, 60663, 257, 6375, 48076, 33567];
  var expectedLittleEndian = [
    41339, 25319, 28928, 63468, 257, 59160, 52411, 8067
  ];
  for (int i = 0; i < byteDataFromU32.lengthInBytes / bytesInElement; ++i) {
    Expect.equals(expectedBigEndian[i],
        byteDataFromU32.getUint16(i * bytesInElement, Endian.big));
    Expect.equals(expectedLittleEndian[i],
        byteDataFromU32.getUint16(
            i * bytesInElement, Endian.little));
  }
}
