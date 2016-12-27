/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract int lastIndexOf(Pattern pattern, [int start])
 * Returns the last position of a match pattern in this string,
 * searching backward starting at start.
 * @description Checks that the correct index is returned
 * @author msyabro
 */
import "../../../Utils/expect.dart";


main() {
  String string = "string";
  
  Expect.isTrue(string.lastIndexOf("st", string.length - 1) == 0);
  Expect.isTrue("sss".lastIndexOf("s", 2) == 2);
  Expect.isTrue("sss".lastIndexOf("s", 1) == 1);
  Expect.isTrue("".lastIndexOf("", 0) == 0);

  Expect.isTrue("\u0000\u0001".lastIndexOf("\u0000", 1) == 0);
}
