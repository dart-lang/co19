/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * double getFloat64(
 *     int byteOffset, [
 *     Endian endian = Endian.big
 * ])
 * Returns the floating point number represented by the eight bytes at the
 * specified [byteOffset] in this object, in IEEE 754 double-precision binary
 * floating-point format (binary64).
 * @description Checks that the correct value is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var f64 = new Float64List.fromList(
      [ .0, .12, 0.123e32, -0.312e-31, 10.0, 1.7976931348623157e308, 4.9e-324]);
  var u32 = new Uint32List.fromList(
      [0x62e7a17b, 0xf7ec7100, 0xe7180101, 0x1f83ccbb]);
  var sizeInBytes =  Float64List.bytesPerElement;

  var byteDataFromF64 = new ByteData.view(f64.buffer);
  for (int i = 0; i < byteDataFromF64.lengthInBytes / sizeInBytes; ++i) {
    Expect.approxEquals(f64[i], byteDataFromF64.getFloat64(i * sizeInBytes,
        Endian.little),(f64[i] / 1e7).abs());
  }

  var byteDataFromU32 = new ByteData.view(u32.buffer);
  var expectedBigEndian = [3.4077838751557705e+287, 7.791149889961446e-304];
  var expectedLittleEndian = [-4.6954507793991304e+269, 7.210606615111715e-157];
  for (int i = 0; i < byteDataFromU32.lengthInBytes / sizeInBytes; ++i) {
    Expect.approxEquals(expectedBigEndian[i],
        byteDataFromU32.getFloat64(i * sizeInBytes, Endian.big),
        (expectedBigEndian[i] / 1e7).abs());
    Expect.approxEquals(expectedLittleEndian[i],
        byteDataFromU32.getFloat64(i * sizeInBytes, Endian.little),
        (expectedLittleEndian[i] / 1e7).abs());
  }
}
