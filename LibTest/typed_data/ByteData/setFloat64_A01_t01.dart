/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * void setFloat64(
 *     int byteOffset,
 *     double value, [
 *     Endian endian = Endian.big
 * ])
 * Sets the eight bytes starting at the specified [byteOffset] in this object to
 * the IEEE 754 double-precision binary floating-point (binary64) representation
 * of the specified [value].
 * @description Checks that the value at the [byteOffset] is set to [value].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var f64 = new Float64List(6);
  var valuesToBeSet = [.0, .12, 0.123e32, -0.312e-31, 10.0, 4.9e-324];
  var expectedBigEndian = [
    .0, -2.2424848378575808e-38, -2.339165719346336e-25,
    -1.3941523508821674e+276, 4.585e-320, 7.291122019556398e-304
  ];
  var sizeInBytes =  Float64List.bytesPerElement;

  var byteDataFromF64 = new ByteData.view(f64.buffer);
  for (int i = 0; i < byteDataFromF64.lengthInBytes / sizeInBytes; ++i) {
    byteDataFromF64.setFloat64(i * sizeInBytes, valuesToBeSet[i],
        Endian.little);
    Expect.approxEquals(valuesToBeSet[i], f64[i], (f64[i] / 1e7).abs());
  }

  for (int i = 0; i < byteDataFromF64.lengthInBytes / sizeInBytes; ++i) {
    byteDataFromF64.setFloat64(i * sizeInBytes, valuesToBeSet[i]);
    Expect.approxEquals(expectedBigEndian[i], f64[i], (f64[i] / 1e7).abs());
  }
}
