/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract int indexOf(Pattern pattern, [int start])
 * Returns -1 if a match could not be found.
 * @description Checks that -1 is returned when appropriate
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue("sss".indexOf("a", 1) == -1);
  Expect.isTrue("string".indexOf("s", 1) == -1);
  Expect.isTrue("s".indexOf("ss", 0) == -1);
  Expect.isTrue("".indexOf("s", 0) == -1);
  Expect.isTrue("s".indexOf("S", 0) == -1);
}
