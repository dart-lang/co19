/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2List asFloat64x2List([int offsetInBytes = 0, int length])
 * Creates a Float64x2List view of a region of this byte buffer.
 * ...
 * The viewed region start at offsetInBytes, which must be 128-bit aligned, and
 * contains length 128-bit integers. If length is omitted, the range extends as
 * far towards the end of the buffer as possible - if lengthInBytes is not
 * divisible by 16, the last bytes can't be part of the view.

 *
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
  // Float64x2List view of a byte buffer
  Float64x2List res = buffer.asFloat64x2List(0);
  int viewSizeInBytes = res.lengthInBytes;
  int viewLength = res.length;
  int shift = (Float64x2List.bytesPerElement == 16) ? 4 : 0;
  int offset1 = 16;
  int length1 = (viewSizeInBytes - offset1) >> shift;
  int offset2 = 32;

  // Float64x2List view of a byte buffer with offset1 and length1
  Float64x2List res1 = buffer.asFloat64x2List(offset1, length1);
  int view1Length = res1.length;

  // Float64x2List view of a byte buffer with offset2
  Float64x2List res2 = buffer.asFloat64x2List(offset2);
  int view2Length = res2.length;

  Expect.isTrue(res1 is Float64x2List);
  Expect.isTrue(res2 is Float64x2List);
  Expect.equals(length1, view1Length);
  Expect.equals((viewSizeInBytes - offset2) >> shift, view2Length);

  if (viewSizeInBytes != 0) {
    Float64x2 v1 = new Float64x2(2.0, 2.1);
    // set value to the first element of res1
    res1[0] = v1;
    Expect.equals(v1.x, res[offset1 >> shift].x);
    Expect.equals(v1.y, res[offset1 >> shift].y);

    Float64x2 v2 = new Float64x2(4.0, 4.1);
    //set value to the last element if res1
    res1[view1Length - 1] = v2;
    Expect.equals(v2.x, res[(offset1 >> shift) + view1Length - 1].x);
    Expect.equals(v2.y, res[(offset1 >> shift) + view1Length - 1].y);

    Float64x2 v3 = new Float64x2(3.0, 3.1);
    // set value to the first element of res2
    res2[0] = v3;
    Expect.equals(v3.x, res[offset2 >> shift].x);
    Expect.equals(v3.y, res[offset2 >> shift].y);

    Float64x2 v4 = new Float64x2(5.0, 5.1);
    // set value to the last element of res2
    res2[view2Length - 1] = v4;
    Expect.equals(v4.x, res[viewLength - 1].x);
    Expect.equals(v4.y, res[viewLength - 1].y);

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
