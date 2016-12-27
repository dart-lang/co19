/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this string ends with [other].
 * @description Checks degenerate cases (empty and equal strings)
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String str = "";
  Expect.isTrue("".endsWith("") == true);
  Expect.isTrue("".endsWith(str) == true);
  Expect.isTrue("someString".endsWith("") == true);
  Expect.isTrue("String".endsWith("String") == true);
}
