/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int getInt8(int byteOffset)
 * ...
 * Throws [RangeError] if [byteOffset] is negative, or greater than or equal to
 * the length of this object.
 * @description Checks that [RangeError] is thrown if [byteOffset] is greater
 * than or equal to the length of this object.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var byteData = new ByteData(5);
  try {
    byteData.getInt8(5);
    Expect.fail("RangeError is expected");
  } on RangeError {}

  try {
    byteData.getInt8(10);
    Expect.fail("RangeError is expected");
  } on RangeError {}
}
