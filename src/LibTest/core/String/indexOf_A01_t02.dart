/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the first location of [other] in this string starting at
 *            [startIndex] (inclusive).
 * @description Tries to pass an index that is out of range
 * @author msyabro
 * @reviewer rodionov
 * @needsreview If index is less then 0, indexOf always returns -1. Is it right?
 */
import "../../../Utils/expect.dart";


main() {
  Expect.isTrue("a".indexOf("a", 2) == -1);
  String str = "string";
  Expect.isTrue(str.indexOf("s", -1) == -1); //?????
}
