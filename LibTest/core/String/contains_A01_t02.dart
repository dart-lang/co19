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
 * @description Checks that it is an error if startIndex is negative or greater
 * than length.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String str = "String with <pattern>";
  RegExp pattern = new RegExp("<.*?>", multiLine: false, caseSensitive: true);

  Expect.throws(() {
    str.contains(pattern, -1);
  }, (e) => e is RangeError);

  Expect.throws(() {
    str.contains(pattern, 0x7fffffff);
  }, (e) => e is RangeError);

  Expect.throws(() {
    str.contains(pattern, 0x80000000);
  }, (e) => e is RangeError);

  Expect.throws(() {
    str.contains(pattern, str.length + 1);
  }, (e) => e is RangeError);
}
