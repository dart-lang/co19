/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Writes [length] bytes into the output stream from
 * the specified array [buffer] starting at specified [offset].
 * @description Incorrect [length] and [offset]
 * @author msyabro
 * @needsreview method unimplemented
 */


void checkIOOR(Array<int> a, int offset, int length) {
  StringBuffer sb = new StringBuffer();
  try {
    sb.writeByteArray(a, offset, length);
    Expect.fail("IndexOutOfRangeException is expected");
  } catch(IndexOutOfRangeException e) {}
}

main() {
  checkIOOR([1, 2, 3, 4], -1, 1);
  checkIOOR([1, 2, 3, 4], 10, 1);
  
  checkIOOR([1, 2, 3, 4], 0, -1); //????
  checkIOOR([1, 2, 3, 4], 0, 5);
}
