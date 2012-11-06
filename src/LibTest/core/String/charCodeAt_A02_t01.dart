/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws RangeError if [index] is out of bounds
 * @description Checks that an RangeError is thrown when the index is out of range
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */


void checkIOOR(String str, int index) {
  try {
    str.charCodeAt(index);
    Expect.fail("RangeError is expected");
  } on RangeError catch(e) {}
}

main() {
  checkIOOR("", 0);
  checkIOOR("string", -1);
  checkIOOR("string", 0x80000000);
  checkIOOR("string", 0x7fffffff);
  checkIOOR("string", 6);
}
