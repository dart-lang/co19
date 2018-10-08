/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * int getUint64(
 *     int byteOffset, [
 *     Endian endian = Endian.big
 * ])
 * Returns the positive integer represented by the eight bytes starting at the
 * specified [byteOffset] in this object, in unsigned binary form.
 * The return value will be between 0 and pow(2, 64) - 1, inclusive.
 * @description Checks that the correct value is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var u64 = new Uint64List.fromList([
    0, 1, 9223372036854775807, 1844674407370955161, 12, 54, 100, 23, 98,
    23, 43, 15, 3
  ]);
  var u32 = new Uint32List.fromList(
      [0x62e7a17b, 0xf7ec7100, 0xe7180101, 0x1f83ccbb]);
  int bytesInElement = Uint64List.bytesPerElement;

  var byteDataFromU64 = new ByteData.view(u64.buffer);
  for (int i = 0; i < byteDataFromU64.lengthInBytes / bytesInElement; ++i) {
    Expect.equals(u64[i],
        byteDataFromU64.getUint64(i*bytesInElement, Endian.little));
  }

  var byteDataFromU32 = new ByteData.view(u32.buffer);
  var expectedBigEndian = [8908655946015829239, 72366452581892895];
  var expectedLittleEndian = [-581966005364350597, 2270883744532922625];
  for (int i = 0; i < byteDataFromU32.lengthInBytes / bytesInElement; ++i) {
    Expect.equals(expectedBigEndian[i],
        byteDataFromU32.getUint64(i * bytesInElement, Endian.big));
    Expect.equals(expectedLittleEndian[i],
        byteDataFromU32.getUint64(
            i * bytesInElement, Endian.little));
  }
}
