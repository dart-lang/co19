/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [NullPointerException] if [str] is [:null:].
 * @description Checks that the correct exception is thrown.
 * @author msyabro
 * @needsreview undocumented
 */

check(String pattern, [bool multiLine = false, bool ignoreCase = false]) {
  RegExp re = new RegExp(pattern, multiLine, ignoreCase);
  try {
    re.stringMatch(null);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}

main() {
  check("");
  check("a");
  check(@"^[^\n\r]+$", true, true);
}

