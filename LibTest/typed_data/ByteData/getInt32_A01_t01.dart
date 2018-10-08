/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * int getInt32(
 *     int byteOffset, [
 *     Endian endian = Endian.big
 * ])
 * Returns the (possibly negative) integer represented by the four bytes at
 * the specified [byteOffset] in this object, in two's complement binary form.
 * The return value will be between -pow(2, 31) and pow(2, 31) - 1, inclusive.
 * @description Checks that the correct value is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var i32 = new Int32List.fromList(
      [0, -1, 2147483647, -2147483648, 12, 54, 100, -23, 98, 23, 43, -15, -3]);
  var u32 = new Uint32List.fromList(
      [0x62e7a17b, 0xf7ec7100, 0xe7180101, 0x1f83ccbb]);
  int bytesInElement = Int32List.bytesPerElement;

  var byteDataFromI32 = new ByteData.view(i32.buffer);
  for (int i = 0; i < byteDataFromI32.lengthInBytes / bytesInElement; ++i) {
    Expect.equals(i32[i],
        byteDataFromI32.getInt32(i * bytesInElement, Endian.little));
  }

  var byteDataFromU32 = new ByteData.view(u32.buffer);
  var expectedBigEndian = [2074208098, 7466231, 16849127, -1144224993];
  var expectedLittleEndian = [1659347323, -135499520, -417857279, 528731323];
  for (int i = 0; i < byteDataFromU32.lengthInBytes / bytesInElement; ++i) {
    Expect.equals(expectedBigEndian[i],
        byteDataFromU32.getInt32(i * bytesInElement, Endian.big));
    Expect.equals(expectedLittleEndian[i],
        byteDataFromU32.getInt32(
            i * bytesInElement, Endian.little));
  }
}
