/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * void setFloat32(
 *     int byteOffset,
 *     double value, [
 *     Endian endian = Endian.big
 * ])
 * Sets the four bytes starting at the specified [byteOffset] in this object to
 * the IEEE 754 single-precision binary floating-point (binary32) representation
 * of the specified [value].
 * @description Checks that the value at the [byteOffset] is set to [value].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var f32 = new Float32List(7);
  var valuesToBeSet = [
    .0, .12, 0.123e32, -0.312e-31, 10.0, 1.401298464324817e-45,
    1.1754943508222875e-38
  ];
  var expectedBigEndian = [
    .0, -1.9224339301483423e-29, 3.78526854048973e+30, -1.542172430965457e+26,
    1.1570521419930015e-41, 2.350988701644575e-38, 4.591774807899561e-41
  ];
  var sizeInBytes =  Float32List.bytesPerElement;

  var byteDataFromF32 = new ByteData.view(f32.buffer);
  for (int i = 0; i < byteDataFromF32.lengthInBytes / sizeInBytes; ++i) {
    byteDataFromF32.setFloat32(i * sizeInBytes, valuesToBeSet[i],
        Endian.little);
    Expect.approxEquals(valuesToBeSet[i], f32[i], (f32[i] / 1e7).abs());
  }

  for (int i = 0; i < byteDataFromF32.lengthInBytes / sizeInBytes; ++i) {
    byteDataFromF32.setFloat32(i * sizeInBytes, valuesToBeSet[i]);
    Expect.approxEquals(expectedBigEndian[i], f32[i], (f32[i] / 1e7).abs());
  }
}
