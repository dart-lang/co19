/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the last location of [other] in this string, searching
 *            backward starting at [fromIndex] (inclusive).
 * @description Tries to pass an index that is out of range
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  String str = "string";
  Expect.isTrue(str.lastIndexOf("s", -1) == -1);
  Expect.isTrue(str.lastIndexOf("s", 0x80000000) == 0);
  Expect.isTrue(str.lastIndexOf("s", str.length) == 0);
  Expect.isTrue(str.lastIndexOf("s", 0x7fffffff) == 0);
}
