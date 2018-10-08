/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a substring of this string in the given range.
 * [startIndex] is inclusive and [endIndex] is exclusive.
 * @description Checks that the returned substring is correct
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String
  string = "stringWithSubstring";

  Expect.isTrue(string.substring(0, 6) == "string");
  Expect.isTrue(string.substring(6, 10) == "With");
  Expect.isTrue(string.substring(10, string.length) == "Substring");
  Expect.isTrue(string.substring(string.length, string.length) == "");

  Expect.isTrue("s".substring(0, 1) == "s");
  Expect.isTrue("s".substring(0, 0) == "");
  Expect.isTrue("".substring(0, 0) == "");
}
