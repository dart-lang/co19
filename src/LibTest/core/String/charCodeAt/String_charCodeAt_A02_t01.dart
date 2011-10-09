/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws IndexOutOfRangeException if [index] is out of bounds
 * @description Check that exception is thrown
 * @author msyabro
 * @needsreview undocumented
 */


void checkIOOR(String str, int index) {
  try {
    str.charCodeAt(index);
    Expect.fail("IndexOutOfRangeException is expected");
  } catch(IndexOutOfRangeException e) {}
}
main() {
  checkIOOR("", 0);
  checkIOOR("string", -1);
  checkIOOR("string", 0xffffffff);
  checkIOOR("string", 0x7fffffff);
  checkIOOR("string", 6);
}
