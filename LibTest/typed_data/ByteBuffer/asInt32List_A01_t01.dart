// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Int32List asInt32List([int offsetInBytes = 0, int length ])
/// Creates a Int32List view of a region of this byte buffer.
/// The view is backed by the bytes of this byte buffer. Any changes made to the
/// Int32List will also change the buffer, and vice versa.
/// @description Checks that method asInt32List creates a Int32List view of
/// a region of this byte buffer, and any changes made to Int32List will also
/// change the buffer, and vice versa.
/// @author ngl@unipro.ru


import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(ByteBuffer buffer) {
  int bufSizeInBytes = buffer.lengthInBytes;
  Int32List res = buffer.asInt32List(0);
  Int32List res1 = buffer.asInt32List(0);
  int viewSizeInBytes = res.lengthInBytes;
  int viewLength = res.length;
  int shift = (Int32List.bytesPerElement == 4) ? 2 : 0;

  Expect.isTrue(res is Int32List);
  Expect.equals(bufSizeInBytes >> shift, viewLength);

  if (viewSizeInBytes != 0) {
    Expect.equals(res[0], res1[0]);

    // set value to the first element of res1
    res1[0] = 2;
    // the first element of res is equal to set value
    Expect.equals(2, res[0]);

    // set value to the last element of res
    res[viewLength - 1] = 4;
    // the last element of res1 is equal to set value
    Expect.equals(4, res1[viewLength - 1]);
  }
  Expect.notEquals(res, res1);
  Expect.equals(res.buffer, res1.buffer);
}

main() {
  var list0 = <int>[];
  var list1 = new List.filled(5, 0);
  var list2 = new List.filled(8, 0);
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
