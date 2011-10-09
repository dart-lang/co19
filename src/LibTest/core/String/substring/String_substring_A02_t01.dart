/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws IndexOutOfRangeException if [startIndex] or [endIndex] is out of bounds.
 * @description Check that exception is thrown when the arguments are out of bounds or in incorrect order.
 * @author msyabro
 * @reviewer rodionov
 */
 

main() {
  String string = "stringWithSubstring";
  
  checkIOOR(string, -1, 6);
  checkIOOR(string, 2, 1);
  checkIOOR(string, 0, string.length + 1);
  checkIOOR(string, 0, 0x7FFFFFFF);
  checkIOOR(string, 0x80000000, 0);
  checkIOOR(string, 0x80000000, 0x7FFFFFFF);
  checkIOOR(string, 0x7FFFFFFF, 0x80000000);
}

void checkIOOR(String str, int start, int end) {
  try {
    str.substring(start, end);
    Expect.fail("IndexOutOfRangeException is expected");
  } catch(IndexOutOfRangeException e) {}
}
