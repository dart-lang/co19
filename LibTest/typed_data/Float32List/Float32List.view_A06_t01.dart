// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Float32List.view(
///     ByteBuffer buffer, [
///     int byteOffset = 0, int length
/// ])
/// ...
/// Throws [ArgumentError] if [offsetInBytes] is not a multiple of
/// BYTES_PER_ELEMENT.
/// @description Checks that an error is thrown if [offsetInBytes] is
/// not a multiple of BYTES_PER_ELEMENT.
/// @author msyabro
/// @issue 43196


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var list = new Float32List(2);
  var buffer = list.buffer;
  for (int i = 1; i < Float32List.bytesPerElement; ++i) {
    Expect.throws(() => Float32List.view(buffer, i));
  }
}
