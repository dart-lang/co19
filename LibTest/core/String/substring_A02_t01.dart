/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws RangeError if [startIndex] or [endIndex] is
 * out of bounds.
 * @description Checks that the correct exception is thrown when the arguments
 * are out of bounds or in incorrect order.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String string = "stringWithSubstring";
  
  check(string, -1, 6);
  check(string, 2, 1);
  check(string, 0, string.length + 1);
  check(string, 0, 0x7FFFFFFF);
  check(string, 0x80000000, 0);
  check(string, 0x80000000, 0x7FFFFFFF);
  check(string, 0x7FFFFFFF, 0x80000000);
}

void check(String str, int start, int end) {
  Expect.throws(() {str.substring(start, end);}, (e) => e is RangeError);
}
