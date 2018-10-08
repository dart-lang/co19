/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setInt8(int byteOffset, int value)
 * Sets the byte at the specified [byteOffset] in this object to the two's
 * complement binary representation of the specified [value], which must fit in
 * a single byte.
 * In other words, [value] must be between -128 and 127, inclusive.
 * @description Checks that the value at the [byteOffset] is set to [value].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var i8 = new Int8List(16);
  var valuesToBeSet =
      [123, -95, -25, 98, 0, 113, -20, -9, 1, 1, 24, -25, -69, -52, -125, 31];
  int bytesInElement = Int8List.bytesPerElement;

  var byteDataFromI8 = new ByteData.view(i8.buffer);
  for (int i = 0; i < byteDataFromI8.lengthInBytes / bytesInElement; ++i) {
    byteDataFromI8.setInt8(i, valuesToBeSet[i]);
  }

  Expect.listEquals(valuesToBeSet, i8);
}
