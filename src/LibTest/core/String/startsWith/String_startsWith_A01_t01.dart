/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this string starts with [other].
 * @description Checks degenerated cases
 * @author msyabro
 * @reviewer rodionov
 */


main() {
  String str = "";
  Expect.isTrue("".startsWith("") == true);
  Expect.isTrue("".startsWith(str) == true);
  Expect.isTrue("someString".startsWith("") == true);
  Expect.isTrue("String".startsWith("String") == true);
}
