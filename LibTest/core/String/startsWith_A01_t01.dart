/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this string starts with [other].
 * @description Checks degenerate cases: empty strings, non-empty but equal
 * strings
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String str = "";
  Expect.isTrue("".startsWith("") == true);
  Expect.isTrue("".startsWith(str) == true);
  Expect.isTrue("someString".startsWith("") == true);
  Expect.isTrue("String".startsWith("String") == true);
}
