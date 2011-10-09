/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Writes [length] bytes into the output stream from
 * the specified array [buffer] starting at specified [offset].
 * @description Try to pass null as argument
 * @author msyabro
 * @needsreview method unimplemented
 */


void checkNPE(Array<int> a, int offset, int length) {
  StringBuffer sb = new StringBuffer();
  try {
    sb.writeByteArray(a, offset, length);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}

main() {
  checkNPE(null, 0, 1);
  checkNPE([1, 2, 3, 4], null, 1);
  checkNPE([1, 2, 3, 4], 0, null);
}
