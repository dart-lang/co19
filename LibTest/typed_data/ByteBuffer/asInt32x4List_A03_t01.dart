/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32x4List asInt32x4List([int offsetInBytes = 0, int length ])
 * Creates a Int32x4List view of a region of this byte buffer.
 * ...
 * The start index and length must describe a valid 128-bit aligned range of
 * the buffer:
 * - offsetInBytes must not be negative,
 * - offsetInBytes must be divisible by sixteen,
 * - length must not be negative, and
 * - offsetInBytes + length * 16 must not be greater than lengthInBytes.
 * @description Checks that creating Int32x4List view with negative offset,
 * with offset not divisible by sixteen, with negative length, or with
 * 'offsetInBytes + length * 16' greater then buffer length causes throwing
 * error at runtime.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(ByteBuffer buffer) {
  int shift = (Int32x4List.bytesPerElement == 16) ? 4 : 0;
  // creates Int32x4List view with negative offset
  Expect.throws(() {
    buffer.asInt32x4List(-16);
  });
  // creates Int32x4List view with offset not divisible by sixteen
  Expect.throws(() {
    buffer.asInt32x4List(1);
  });
  // creates Int32x4List view with negative length
  Expect.throws(() {
    buffer.asInt32x4List(0, -8);
  });
  // creates Int32x4List view with 'offsetInBytes + length * 16' greater then
  // buffer length
  Expect.throws(() {
    buffer.asInt32x4List(16, buffer.lengthInBytes >> shift);}
    );
}

main() {
  var list2 = new List.filled(32, 0);
  var list4 = new Int32x4List(6);

  check((new Int8List.fromList(list2)).buffer);
  check((new Int16List.fromList(list2)).buffer);
  check((new Int32List.fromList(list2)).buffer);
  check((new Int64List.fromList(list2)).buffer);
  check((new Int32x4List.fromList(list4)).buffer);
}
