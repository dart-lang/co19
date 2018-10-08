/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32x4List asInt32x4List([int offsetInBytes = 0, int length ])
 * Creates a Int32x4List view of a region of this byte buffer.
 * ...
 * The viewed region start at offsetInBytes, which must be 128-bit aligned, and
 * contains length 128-bit integers. If length is omitted, the range extends as
 * far towards the end of the buffer as possible - if lengthInBytes is not
 * divisible by 16, the last bytes can't be part of the view.
 * @description Checks that the viewed region begins with offsetInBytes byte,
 * which must be 128-bit aligned, and contains length 128-bit integers. If
 * length is omitted, the range extends to the end of the buffer (if buffer
 * length in bytes is divisible by sixteen), otherwise, the last bytes can't be
 * part of the view.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(ByteBuffer buffer) {
  int bufSizeInBytes = buffer.lengthInBytes;
  // Float32List view of a byte buffer
  Int32x4List res = buffer.asInt32x4List(0);
  int viewSizeInBytes = res.lengthInBytes;
  int viewLength = res.length;
  int shift = (Int32x4List.bytesPerElement == 16) ? 4 : 0;
  int offset1 = 16;
  int length1 = (viewSizeInBytes - offset1) >> shift;
  int offset2 = 32;

  // Float32List view of a byte buffer with offset1 and length1
  Int32x4List res1 = buffer.asInt32x4List(offset1, length1);
  int view1Length = res1.length;

  // Float32List view of a byte buffer with offset2
  Int32x4List res2 = buffer.asInt32x4List(offset2);
  int view2Length = res2.length;

  Expect.isTrue(res1 is Int32x4List);
  Expect.isTrue(res2 is Int32x4List);
  Expect.equals(length1, view1Length);
  Expect.equals((viewSizeInBytes - offset2) >> shift, view2Length);

  if (viewSizeInBytes != 0) {
    Int32x4 v1 = new Int32x4(2, 3, 4, 5);
    // set value to the first element of res1
    res1[0] = v1;
    Expect.equals(v1.x, res[offset1 >> shift].x);
    Expect.equals(v1.y, res[offset1 >> shift].y);
    Expect.equals(v1.z, res[offset1 >> shift].z);
    Expect.equals(v1.w, res[offset1 >> shift].w);

    Int32x4 v2 = new Int32x4(4, 5, 6, 7);
    //set value to the last element if res1
    res1[view1Length - 1] = v2;
    Expect.equals(v2.x, res[(offset1 >> shift) + view1Length - 1].x);
    Expect.equals(v2.y, res[(offset1 >> shift) + view1Length - 1].y);
    Expect.equals(v2.z, res[(offset1 >> shift) + view1Length - 1].z);
    Expect.equals(v2.w, res[(offset1 >> shift) + view1Length - 1].w);

    Int32x4 v3 = new Int32x4(3, 4, 5, 6);
    // set value to the first element of res2
    res2[0] = v3;
    Expect.equals(v3.x, res[offset2 >> shift].x);
    Expect.equals(v3.y, res[offset2 >> shift].y);
    Expect.equals(v3.z, res[offset2 >> shift].z);
    Expect.equals(v3.w, res[offset2 >> shift].w);

    Int32x4 v4 = new Int32x4(5, 6, 7, 8);
    // set value to the last element of res2
    res2[view2Length - 1] = v4;
    Expect.equals(v4.x, res[viewLength - 1].x);
    Expect.equals(v4.y, res[viewLength - 1].y);
    Expect.equals(v4.z, res[viewLength - 1].z);
    Expect.equals(v4.w, res[viewLength - 1].w);

    if (bufSizeInBytes != viewSizeInBytes) {
      ByteData resb = buffer.asByteData(0);
      int cv = 0;
      // checks that last 'bufSizeInBytes - viewSizeInBytes' bytes contain 0
      for (int i = viewSizeInBytes; i < bufSizeInBytes; i++) {
        int v = resb.getInt8(i);
        cv |= v;
      }
      Expect.equals(0, cv);
    }
  }
}

main() {
  var list1 = new List.filled(64, 0);
  var list2 = new List.filled(65, 0);
  var list4 = new Int32x4List(6);

  check((new Int8List.fromList(list1)).buffer);
  check((new Int8List.fromList(list2)).buffer);

  check((new Int16List.fromList(list1)).buffer);
  check((new Int16List.fromList(list2)).buffer);

  check((new Int32List.fromList(list1)).buffer);
  check((new Int32List.fromList(list2)).buffer);

  check((new Int32List.fromList(list1)).buffer);
  check((new Int64List.fromList(list2)).buffer);

  check((new Int32x4List.fromList(list4)).buffer);
}
