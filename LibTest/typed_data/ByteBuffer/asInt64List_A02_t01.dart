/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int64List asInt64List([int offsetInBytes = 0, int length ])
 * Creates a Int64List view of a region of this byte buffer.
 * ...
 * The viewed region start at offsetInBytes, which must be 64-bit aligned, and
 * contains length 64-bit integers. If length is omitted, the range extends as
 * far towards the end of the buffer as possible - if lengthInBytes is not
 * divisible by eight, the last bytes can't be part of the view.
 * @description Checks that the viewed region begins with offsetInBytes byte,
 * which must be 64-bit aligned, and contains length 64-bit integers. If length
 * is omitted, the range extends to the end of the buffer (if buffer length in
 * bytes is divisible by eight), otherwise, the last bytes can't be part of the
 * view.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(ByteBuffer buffer) {
  int bufSizeInBytes = buffer.lengthInBytes;
  // Int64List view of a byte buffer
  Int64List res = buffer.asInt64List(0);
  int viewSizeInBytes = res.lengthInBytes;
  int viewLength = res.length;
  int shift = (Int64List.bytesPerElement == 8) ? 3 : 0;
  int offset1 = 8;
  int length1 = ((viewSizeInBytes - offset1) >> shift) - 1;
  int offset2 = 16;

  // Int64List view of a byte buffer with offset1 and length1
  Int64List res1 = buffer.asInt64List(offset1, length1);
  int view1Length = res1.length;

  // Int64List view of a byte buffer with offset2
  Int64List res2 = buffer.asInt64List(offset2);
  int view2Length = res2.length;

  Expect.isTrue(res1 is Int64List);
  Expect.isTrue(res2 is Int64List);
  Expect.equals(length1, view1Length);
  Expect.equals((viewSizeInBytes - offset2) >> shift, view2Length);

  if (viewSizeInBytes != 0) {
    // set value to the first element of res1
    res1[0] = 2;
    Expect.equals(2, res[offset1 >> shift]);
    //set value to the last element if res1
    res1[view1Length - 1] = 4;
    Expect.equals(4, res[(offset1 >> shift) + view1Length - 1]);

    // set value to the first element of res2
    res2[0] = 3;
    Expect.equals(3, res[offset2 >> shift]);
    // set value to the last element of res2
    res2[view2Length - 1] = 5;
    Expect.equals(5, res[viewLength - 1]);

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
  var list1 = new List.filled(24, 0);
  var list2 = new List.filled(27, 0);
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
