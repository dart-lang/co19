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
import "../../../Utils/expect.dart";

main() {
  String str = "String with <pattern>";
  RegExp pattern = new RegExp("<.*?>", multiLine: false, caseSensitive: true);

  try {
    str.contains(pattern, -1);
    Expect.fail("RangeError expected!");
  } on RangeError catch(ok){}

  try {
    str.contains(pattern, 0x7fffffff);
    Expect.fail("RangeError expected!");
  } on RangeError catch(ok){}

  try {
    str.contains(pattern, 0x80000000);
    Expect.fail("RangeError expected!");
  } on RangeError catch(ok){}

  try {
    str.contains(pattern, str.length);
    Expect.fail("RangeError expected!");
  } on RangeError catch(ok){}

}

