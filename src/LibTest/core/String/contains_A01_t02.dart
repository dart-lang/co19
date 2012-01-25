/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this string contains [other] starting at
 *            [startIndex] (inclusive).
 * @description Checks method with out of bounds [startIndex]
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */
 

main() {
  String str = "String with <pattern>";
  RegExp pattern = const RegExp("<.*>", false, false);

  Expect.isTrue(str.contains(pattern, -1));
  Expect.isFalse(str.contains(pattern, str.length));
  Expect.isFalse(str.contains(pattern, 0x80000000));
  Expect.isFalse(str.contains(pattern, 0x7fffffff));
}

