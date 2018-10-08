/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int64List asInt64List([int offsetInBytes = 0, int length ])
 * Creates a Int64List view of a region of this byte buffer.
 * ...
 * The start index and length must describe a valid 64-bit aligned range of the
 * buffer:
 * - offsetInBytes must not be negative,
 * - offsetInBytes must be divisible by eight,
 * - length must not be negative, and
 * - offsetInBytes + length * 8 must not be greater than lengthInBytes.
 * @description Checks that creating Int64List view with negative offset,
 * with offset not divisible by eight, with negative length, or with
 * 'offsetInBytes + length * 8' greater then buffer length causes throwing
 * error at runtime.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(ByteBuffer buffer) {
  int shift = (Int64List.bytesPerElement == 8) ? 3 : 0;
  // creates Int64List view with negative offset
  Expect.throws(() {
    buffer.asInt64List(-8);
  });
  // creates Int64List view with offset not divisible by four
  Expect.throws(() {
    buffer.asInt64List(1);
  });
  // creates Int64List view with negative length
  Expect.throws(() {
    buffer.asInt64List(0, -8);
  });
  // creates Int64List view with 'offsetInBytes + length * 4'
  // greater then buffer length
  Expect.throws(() {
    buffer.asInt64List(8, buffer.lengthInBytes >> shift);
  });
}

main() {
  var list2 = new List.filled(8, 0);
  var list4 = new Int32x4List(6);

  check((new Int8List.fromList(list2)).buffer);
  check((new Int16List.fromList(list2)).buffer);
  check((new Int32List.fromList(list2)).buffer);
  check((new Int64List.fromList(list2)).buffer);
  check((new Int32x4List.fromList(list4)).buffer);
}
