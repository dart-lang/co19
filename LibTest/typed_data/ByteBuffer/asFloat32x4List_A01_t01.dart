/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4List asFloat32x4List([int offsetInBytes = 0, int length])
 * Creates a Float32x4List view of a region of this byte buffer.
 * The view is backed by the bytes of this byte buffer. Any changes made to the
 * Float32x4List will also change the buffer, and vice versa.
 * @description Checks that method asFloat32x4List creates a Float32x4List view
 * of a region of this byte buffer, and any changes made to Float32x4List will
 * also change the buffer, and vice versa.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(ByteBuffer buffer){
  int bufSizeInBytes = buffer.lengthInBytes;
  Float32x4List res = buffer.asFloat32x4List(0);
  Float32x4List res1 = buffer.asFloat32x4List(0);
  int viewSizeInBytes = res.lengthInBytes;
  int viewLength = res.length;
  int shift = (Float32x4List.bytesPerElement == 16) ? 4 : 0;

  Expect.isTrue(res is Float32x4List);
  Expect.equals(bufSizeInBytes >> shift, viewLength);

  if (viewSizeInBytes != 0) {
    Expect.equals(res1[0].x, res[0].x);
    Expect.equals(res1[0].y, res[0].y);
    Expect.equals(res1[0].z, res[0].z);
    Expect.equals(res1[0].w, res[0].w);

    Float32x4 v1 = new Float32x4(2.0, 2.1, 2.2, 2.3);
    // set value to the first element of res1
    res1[0] = v1;
    // the first element of res is equal to set value
    Expect.equals(v1.x, res[0].x);
    Expect.equals(v1.y, res[0].y);
    Expect.equals(v1.z, res[0].z);
    Expect.equals(v1.w, res[0].w);

    Float32x4 v2 = new Float32x4(4.0, 4.1, 4.2, 4.3);
    // set value to the last element of res
    res[viewLength - 1] = v2;
    // the last element of res1 is equal to set value
    Expect.equals(v2.x, res[viewLength - 1].x);
    Expect.equals(v2.y, res[viewLength - 1].y);
    Expect.equals(v2.z, res[viewLength - 1].z);
    Expect.equals(v2.w, res[viewLength - 1].w);
  }
  Expect.notEquals(res, res1);
  Expect.equals(res.buffer, res1.buffer);
}

main() {
  var list0 = new List<int>(0);
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

  check((new Int64List.fromList(list0)).buffer);
  check((new Int64List.fromList(list1)).buffer);
  check((new Int64List.fromList(list2)).buffer);

  check((new Int32x4List.fromList(list5)).buffer);
  check((new Int32x4List.fromList(list3)).buffer);
  check((new Int32x4List.fromList(list4)).buffer);
}
