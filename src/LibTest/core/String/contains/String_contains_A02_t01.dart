/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws IndexOutOfRangeException if [startIndex] is out of bounds.
 * @description Check that this exception is thrown when appropriate
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */
 

main() {
  String str = "String with <pattern>";
  RegExp pattern = const RegExp("<.*>", false, false);
  
  check(str, pattern, -1);
  check(str, pattern, str.length);
  check(str, pattern, 0x80000000);
  check(str, pattern, 0x7fffffff);
}

void check(String str, Pattern pattern, int idx) {
  try {
    str.contains(pattern, idx);
    Expect.fail("IndexOutOfRangeException is expected");
  } catch(IndexOutOfRangeException e) {}
}
