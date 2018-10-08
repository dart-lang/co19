/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract bool contains(Pattern other, [int startIndex = 0])
 * Returns whether this string contains a match of other.
 * If startIndex is provided, only matches at or after that index are considered.
 * It is an error if startIndex is negative or greater than length.
 * @description Checks that this function works correctly
 * @author msyabro
 */
import "../../../Utils/expect.dart";

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
