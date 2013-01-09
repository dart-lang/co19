/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this string contains [other] starting at
 *            [startIndex] (inclusive).
 * @description Checks that this function works correctly
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  String str = "String with <pattern>";
  RegExp pattern = new RegExp("<.*>", multiLine: false, caseSensitive: true);

  Expect.isTrue(str.contains("", 0));
  Expect.isTrue(str.contains(pattern, 0));
  Expect.isTrue(str.contains(pattern, 12));
  Expect.isFalse(str.contains(pattern, 13));
  
  Expect.isTrue("".contains("", 0));
  Expect.isFalse("".contains("a", 0));
  Expect.isFalse("abc".contains("ac", 0));
  Expect.isFalse("abc".contains("a_c", 0));
}
