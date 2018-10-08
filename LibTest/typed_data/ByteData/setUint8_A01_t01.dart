/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setUint8(int byteOffset, int value)
 * Sets the byte at the specified [byteOffset] in this object to the two's
 * complement binary representation of the specified [value], which must fit in
 * a single byte.
 * In other words, [value] must be between 0 and 255, inclusive.
 * @description Checks that the value at the [byteOffset] is set to [value].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var u8 = new Uint8List(16);
  var valuesToBeSet = [
    123, 161, 231, 98, 0, 113, 236, 247, 1, 1, 24, 231, 187, 204, 131, 31
  ];
  int bytesInElement =  Uint8List.bytesPerElement;

  var byteData = new ByteData.view(u8.buffer);
  for (int i = 0; i < byteData.lengthInBytes / bytesInElement; ++i) {
    byteData.setUint8(i, valuesToBeSet[i]);
  }

  Expect.listEquals(valuesToBeSet, u8);
}
