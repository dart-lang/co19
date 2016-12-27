/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract int lastIndexOf(Pattern pattern, [int start])
 * Returns -1 if other could not be found.
 * @description Checks that -1 is returned when appropriate
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue("sss".lastIndexOf("a", 1) == -1);
  Expect.isTrue("string".lastIndexOf("g", 1) == -1);
  Expect.isTrue("string".lastIndexOf("S", 1) == -1);
  Expect.isTrue("".lastIndexOf("s", 0) == -1);
  Expect.isTrue("s".lastIndexOf("ss", 1) == -1);
}
