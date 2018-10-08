/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Uint8ClampedList asUint8ClampedList([
 *     int offsetInBytes = 0,
 *     int length
 * ])
 * Creates a Uint8ClampedList view of a region of this byte buffer.
 * ...
 * The start index and length must describe a valid range of the buffer:
 * - offsetInBytes must not be negative,
 * - length must not be negative, and
 * - offsetInBytes + length must not be greater than lengthInBytes.
 * @description Checks that creating Uint8ClampedList view with negative offset,
 * negative length, or 'offsetInBytes + length' greater then buffer length
 * causes throwing error at runtime.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(ByteBuffer buffer) {
  // creates Uint8ClampedList view with negative offset
  Expect.throws(() {
    buffer.asUint8ClampedList(-1);
  });
  // creates Uint8ClampedList view with negative length
  Expect.throws(() {
    buffer.asUint8ClampedList(1, -8);
  });
  // creates view with length + offset greater then buffer length
  Expect.throws(() {
    buffer.asUint8ClampedList(1, buffer.lengthInBytes);
  });
}

main() {
  var list2 = new List.filled(6, 0);
  var list4 = new Int32x4List(6);

  check((new Int8List.fromList(list2)).buffer);
  check((new Int16List.fromList(list2)).buffer);
  check((new Int32List.fromList(list2)).buffer);
  check((new Int64List.fromList(list2)).buffer);
  check((new Int32x4List.fromList(list4)).buffer);
}
