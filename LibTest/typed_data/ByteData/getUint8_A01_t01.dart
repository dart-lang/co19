/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int getUint8(int byteOffset)
 * Returns the positive integer represented by the byte at the specified
 * [byteOffset] in this object, in unsigned binary form.
 * The return value will be between 0 and 255, inclusive.
 * @description Checks that the correct value is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var u8 = new Uint8List.fromList(
      [0, 255, 128, 127, 12, 54, 100, 23, 98, 200, 43, 15, 3]);
  var u32 = new Uint32List.fromList(
      [0x62e7a17b, 0xf7ec7100, 0xe7180101,  0x1f83ccbb]);
  int bytesInElement = Uint8List.bytesPerElement;

  var byteDataFromU8 = new ByteData.view(u8.buffer);
  for (int i = 0; i < byteDataFromU8.lengthInBytes / bytesInElement; ++i) {
    Expect.equals(u8[i], byteDataFromU8.getUint8(i));
  }

  var byteDataFromU32 = new ByteData.view(u32.buffer);
  var expected = [
    123, 161, 231, 98, 0, 113, 236, 247, 1, 1, 24, 231, 187, 204, 131, 31
  ];
  for (int i = 0; i < byteDataFromU32.lengthInBytes / bytesInElement; ++i) {
    Expect.equals(expected[i], byteDataFromU32.getUint8(i));
  }
}
