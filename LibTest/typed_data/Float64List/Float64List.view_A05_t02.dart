// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Float64List.view(
///     ByteBuffer buffer, [
///     int byteOffset = 0,
///     int length
/// ])
/// ...
/// Throws [RangeError] if [offsetInBytes] or [length] are negative, or if
/// [offsetInBytes] + ([length] * elementSizeInBytes) is greater than the
/// length of [buffer].
/// @description Checks that an error is thrown if [length] is negative.
/// @author msyabro
/// @issue 43196


import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<double> array, int offset, int length) {
  var tmp = new Float64List.fromList(array);
  var byteBuffer = tmp.buffer;
  Expect.throws(() { Float64List.view(byteBuffer, offset, length); });
}

main() {
  check([0.0], 0, -5);
  check([100.0, 50.0], 1, -100);
  check([
    0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0,
    14.0, 15.0, 16.0, 17.0
  ], 10, -1);
}
