/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the first location of [other] in this string 
 * starting at [startIndex] (inclusive).
 * @description Try to pass out of range index
 * @author msyabro
 * @needsreview If index less then 0, indexOf always returns -1. Is it right?
 */


main() {
  Expect.isTrue("a".indexOf("a", 2) == -1);
  String str = "string";
  Expect.isTrue(str.indexOf("s", -1) == -1); //?????
}
