/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ByteData asByteData([int offsetInBytes = 0, int length ])
 * Creates a ByteData view of a region of this byte buffer.
 * The view is backed by the bytes of this byte buffer. Any changes made to
 * the ByteData will also change the buffer, and vice versa.
 * @description Checks that method asByteData creates a ByteData view of a
 * region of this byte buffer and any changes made to ByteData will also change
 * the buffer, and vice versa. The checking is done for buffers of lists with
 * different elements size.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(ByteBuffer buffer, int list_length, int elsize_inbytes) {
  ByteData res = buffer.asByteData(0);
  ByteData res1 = buffer.asByteData(0);
  int viewSizeInBytes = res.lengthInBytes;

  Expect.isTrue(res is ByteData);
  Expect.equals(list_length * elsize_inbytes, viewSizeInBytes);

  if (viewSizeInBytes != 0) {
    // set value to the first byte of res1
    res1.setInt8(0, 2);
    // the first byte of res is equal to the set value
    Expect.equals(2, res.getInt8(0));

    // set value to the last byte of res
    res.setInt8(viewSizeInBytes - 1, 4);
    // the last byte of res1 is equal to the set value
    Expect.equals(4, res1.getInt8(viewSizeInBytes - 1));
  }
  Expect.notEquals(res, res1);
  Expect.equals(res.buffer, res1.buffer);
}

main() {
  var list0 = new List(0);
  int list0_length = list0.length;
  var list1 = new List.filled(1, 0);
  int list1_length = list1.length;
  var list2 = new List.filled(5, 0);
  int list2_length = list2.length;
  var list3 = new Int32x4List(1);
  int list3_length = list3.length;
  var list4 = new Int32x4List(5);
  int list4_length = list4.length;

  check((new Int8List.fromList(list0)).buffer, list0_length,
      Int8List.BYTES_PER_ELEMENT);
  check((new Int8List.fromList(list1)).buffer, list1_length,
      Int8List.BYTES_PER_ELEMENT);
  check((new Int8List.fromList(list2)).buffer, list2_length,
      Int8List.BYTES_PER_ELEMENT);

  check((new Int16List.fromList(list0)).buffer, list0_length,
      Int16List.BYTES_PER_ELEMENT);
  check((new Int16List.fromList(list1)).buffer, list1_length,
      Int16List.BYTES_PER_ELEMENT);
  check((new Int16List.fromList(list2)).buffer, list2_length,
      Int16List.BYTES_PER_ELEMENT);

  check((new Int32List.fromList(list0)).buffer, list0_length,
      Int32List.BYTES_PER_ELEMENT);
  check((new Int32List.fromList(list1)).buffer, list1_length,
      Int32List.BYTES_PER_ELEMENT);
  check((new Int32List.fromList(list2)).buffer, list2_length,
      Int32List.BYTES_PER_ELEMENT);

  check((new Int64List.fromList(list0)).buffer, list0_length,
      Int64List.BYTES_PER_ELEMENT);
  check((new Int64List.fromList(list1)).buffer, list1_length,
      Int64List.BYTES_PER_ELEMENT);
  check((new Int64List.fromList(list2)).buffer, list2_length,
      Int64List.BYTES_PER_ELEMENT);

  check((new Int32x4List.fromList(list0)).buffer, list0_length,
      Int32x4List.BYTES_PER_ELEMENT);
  check((new Int32x4List.fromList(list3)).buffer, list3_length,
      Int32x4List.BYTES_PER_ELEMENT);
  check((new Int32x4List.fromList(list4)).buffer, list4_length,
      Int32x4List.BYTES_PER_ELEMENT);
}
