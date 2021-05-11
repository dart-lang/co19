// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// int getUint32(
///     int byteOffset, [
///     Endian endian = Endian.big
/// ])
/// ...
/// Throws [RangeError] if [byteOffset] is negative, or `byteOffset + 4` is
/// greater than the length of this object.
/// @description Checks that an error is thrown if [byteOffset] is negative.
/// @author msyabro
/// @issue 43196


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var byteData = new ByteData(0);
  Expect.throws(() { byteData.getUint32(-1); });
}
