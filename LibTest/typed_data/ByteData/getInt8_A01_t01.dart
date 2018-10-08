/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int getInt8(int byteOffset)
 * Returns the (possibly negative) integer represented by the byte at the
 * specified [byteOffset] in this object, in two's complement binary
 * representation.
 * The return value will be between -128 and 127, inclusive.
 * @description Checks that the correct value is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var i8 = new Int8List.fromList(
      [0, -1, 128, -127, 12, 54, 100, -23, 98, 23, 43, -15, -3]);
  var u32 = new Uint32List.fromList(
      [0x62e7a17b, 0xf7ec7100, 0xe7180101, 0x1f83ccbb]);
  int bytesInElement = Int8List.bytesPerElement;

  var byteDataFromI8 = new ByteData.view(i8.buffer);
  for (int i = 0; i < byteDataFromI8.lengthInBytes / bytesInElement; ++i) {
    Expect.equals(i8[i], byteDataFromI8.getInt8(i));
  }

  var byteDataFromU32 = new ByteData.view(u32.buffer);
  var expected = [
    123, -95, -25, 98, 0, 113, -20, -9, 1, 1, 24, -25, -69, -52, -125, 31
  ];
  for (int i = 0; i < byteDataFromU32.lengthInBytes / bytesInElement; ++i) {
    Expect.equals(expected[i], byteDataFromU32.getInt8(i));
  }
}
