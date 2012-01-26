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
 * @needsreview Issue 1289
 */

main() {
  String str = "String with <pattern>";
  RegExp pattern = const RegExp("<.*>", false, false);

  try {
    str.contains(pattern, -1);
    Expect.fail("IndexOutOfRangeException expected!");
  } catch(IndexOutOfRangeException ok){}

  try {
    str.contains(pattern, 0x7fffffff);
    Expect.fail("IndexOutOfRangeException expected!");
  } catch(IndexOutOfRangeException ok){}

  try {
    str.contains(pattern, 0x80000000);
    Expect.fail("IndexOutOfRangeException expected!");
  } catch(IndexOutOfRangeException ok){}

  try {
    str.contains(pattern, str.length);
    Expect.fail("IndexOutOfRangeException expected!");
  } catch(IndexOutOfRangeException ok){}

}

