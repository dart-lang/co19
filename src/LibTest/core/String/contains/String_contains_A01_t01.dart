/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this string contains [other] starting
 * at [startIndex] (inclusive).
 * @description Check that function works correctly
 * @author msyabro
 */
 

main() {
  String str = "String with <pattern>";
  RegExp pattern = const RegExp("<.*>", "");
  
  Expect.isTrue(str.contains("", 0) == true);
  Expect.isTrue(str.contains(pattern, 0) == true);
  Expect.isTrue(str.contains(pattern, 12) == true);
  Expect.isTrue(str.contains(pattern, 13) == false);
  Expect.isTrue("".contains("", 0) == true);
  Expect.isTrue("".contains("a", 0) == false);
  Expect.isTrue("abc".contains("ac", 0) == false);
  Expect.isTrue("abc".contains("a_c", 0) == false);
}
