// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Int8List asInt8List([int offsetInBytes = 0, int length ])
/// Creates a Int8List view of a region of this byte buffer.
/// The view is backed by the bytes of this byte buffer. Any changes made to the
/// Int8List will also change the buffer, and vice versa.
/// @description Checks that method asInt8List creates a Int8List view of a
/// region of this byte buffer, and any changes made to Int8List will also change
/// the buffer, and vice versa. The checking is done for buffers of lists with
/// different elements size.
/// @author ngl@unipro.ru


import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(ByteBuffer buffer) {
  int bufSizeInBytes = buffer.lengthInBytes;
  Int8List res = buffer.asInt8List(0);
  Int8List res1 = buffer.asInt8List(0);
  int viewSizeInBytes = res.lengthInBytes;

  Expect.isTrue(res is Int8List);
  Expect.equals(bufSizeInBytes, viewSizeInBytes);

  if (viewSizeInBytes != 0) {
    // set value to the first byte of res1
    res1[0] = 2;
    // the first byte of res is equal to the set value
    Expect.equals(2, res[0]);

    // set value to the last byte of res
    res[viewSizeInBytes - 1] = 4;
    // the last byte of res1 is equal to the set value
    Expect.equals(4, res1[viewSizeInBytes - 1]);
  }
  Expect.notEquals(res, res1);
  Expect.equals(res.buffer, res1.buffer);
}

main() {
  var list0 = <int>[];
  var list1 = new List.filled(1, 0);
  var list2 = new List.filled(5, 0);
  var list3 = new Int32x4List(1);
  var list4 = new Int32x4List(5);
  var list5 = new Int32x4List(0);

  check((new Int8List.fromList(list0)).buffer);
  check((new Int8List.fromList(list1)).buffer);
  check((new Int8List.fromList(list2)).buffer);

  check((new Int16List.fromList(list0)).buffer);
  check((new Int16List.fromList(list1)).buffer);
  check((new Int16List.fromList(list2)).buffer);

  check((new Int32List.fromList(list0)).buffer);
  check((new Int32List.fromList(list1)).buffer);
  check((new Int32List.fromList(list2)).buffer);

  if (!isJS) {
    check((new Int64List.fromList(list0)).buffer);
    check((new Int64List.fromList(list1)).buffer);
    check((new Int64List.fromList(list2)).buffer);
  }
  check((new Int32x4List.fromList(list5)).buffer);
  check((new Int32x4List.fromList(list3)).buffer);
  check((new Int32x4List.fromList(list4)).buffer);
}
