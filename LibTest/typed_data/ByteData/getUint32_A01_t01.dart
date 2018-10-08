/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * int getUint32(
 *     int byteOffset, [
 *     Endian endian = Endian.big
 * ])
 * Returns the positive integer represented by the four bytes starting at the
 * specified [byteOffset] in this object, in unsigned binary form.
 * The return value will be between 0 and pow(2, 32) - 1, inclusive.
 * @description Checks that the correct value is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var u32 = new Uint32List.fromList(
      [0, 1, 2147483647, 4294967295, 12, 54, 100, 23, 98, 23, 43, 15, 3]);
  var u8 = new Uint8List.fromList([
    0x62, 0xe7, 0xa1, 0x7b, 0xf7, 0xec, 0x71, 0x00, 0xe7, 0x18, 0x01, 0x01,
    0x1f, 0x83, 0xcc, 0xbb
  ]);
  int bytesInElement = Uint32List.bytesPerElement;

  var byteDataFromU32 = new ByteData.view(u32.buffer);
  for (int i = 0; i < byteDataFromU32.lengthInBytes / bytesInElement; ++i) {
    Expect.equals(u32[i],
        byteDataFromU32.getUint32(
            i * bytesInElement, Endian.little));
  }

  var byteDataFromU8 = new ByteData.view(u8.buffer);
  var expectedBigEndian = [1659347323, 4159467776, 3877110017, 528731323];
  var expectedLittleEndian = [2074208098, 7466231, 16849127, 3150742303];
  for (int i = 0; i < byteDataFromU8.lengthInBytes / bytesInElement; ++i) {
    Expect.equals(expectedBigEndian[i],
        byteDataFromU8.getUint32(i * bytesInElement, Endian.big));
    Expect.equals(expectedLittleEndian[i],
        byteDataFromU8.getUint32(i * bytesInElement, Endian.little));
  }
}
