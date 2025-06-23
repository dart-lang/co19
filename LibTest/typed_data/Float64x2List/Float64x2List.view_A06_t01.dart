// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Float64x2List.view(
///     ByteBuffer buffer, [
///     int offsetInBytes = 0,
///     int length
/// ])
/// Throws ArgumentError if offsetInBytes is not a multiple of BYTES_PER_ELEMENT.
/// @description Checks that an error is thrown if offsetInBytes is not
/// a multiple of BYTES_PER_ELEMENT.
/// @author ngl@unipro.ru
/// @issue 43210

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  Float64x2List tmp = new Float64x2List(4);
  var byteBuffer = tmp.buffer;
  for (int i = 1; i < Float64x2List.bytesPerElement; ++i) {
    Expect.throws(() {
      Float64x2List.view(byteBuffer, i);
    }, (e) => e is ArgumentError);
  }
}
