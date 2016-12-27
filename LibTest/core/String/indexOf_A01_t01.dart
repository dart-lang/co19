/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract int indexOf(Pattern pattern, [int start])
 * Returns the first position of a match of pattern in this string, starting at
 * start.
 * @description Checks that the correct index is returned
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue("string".indexOf("tr", 0) == 1);
  Expect.isTrue("sss".indexOf("s", 0) == 0);
  Expect.isTrue("sss".indexOf("s", 1) == 1);
  Expect.isTrue("a".indexOf("a", 0) == 0);
  Expect.isTrue("".indexOf("", 0) == 0);

  Expect.isTrue("\u0000\u0001".indexOf("\u0000", 0) == 0);
}
