/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * double getFloat32(
 *     int byteOffset, [
 *     Endian endian = Endian.big
 * ])
 * Returns the floating point number represented by the four bytes at the
 * specified [byteOffset] in this object, in IEEE 754 single-precision binary
 * floating-point format (binary32).
 * @description Checks that the correct value is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var f32 = new Float32List.fromList([
    .0, .12, 0.123e32, -0.312e-31, 10.0, 1.401298464324817e-45,
    1.1754943508222875e-38
  ]);
  var u32 = new Uint32List.fromList(
      [0x62e7a17b, 0xf7ec7100, 0xe7180101, 0x1f83ccbb]);
  var sizeInBytes =  Float32List.bytesPerElement;

  var byteDataFromF32 = new ByteData.view(f32.buffer);
  for (int i = 0; i < byteDataFromF32.lengthInBytes / sizeInBytes; ++i) {
    Expect.approxEquals(f32[i], byteDataFromF32.getFloat32(i * sizeInBytes,
        Endian.little),(f32[i] / 1e7).abs());
  }

  var byteDataFromU32 = new ByteData.view(u32.buffer);
  var expectedBigEndian = [
    1.6813055904049544e+36, 1.0462418034594343e-38,
    2.3711424564181874e-38, -0.006241216789931059
  ];
  var expectedLittleEndian = [
    2.136416887544574e+21, -9.591202897651812e+33,
    -7.178182241978538e+23, 5.581935619425446e-20
  ];
  for (int i = 0; i < byteDataFromU32.lengthInBytes / sizeInBytes; ++i) {
    Expect.approxEquals(expectedBigEndian[i],
        byteDataFromU32.getFloat32(i * sizeInBytes, Endian.big),
        (expectedBigEndian[i] / 1e7).abs());
    Expect.approxEquals(expectedLittleEndian[i],
        byteDataFromU32.getFloat32(i * sizeInBytes, Endian.little),
        (expectedLittleEndian[i] / 1e7).abs());
  }
}
