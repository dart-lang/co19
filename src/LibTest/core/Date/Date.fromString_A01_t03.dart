/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.fromString(String formattedString) constructs a new [Date] instance
 * based on [formattedString]
 * @description Checks that a string in the correct format but with incorrect components raises an exception.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview Format is not specified. The assumption was made by the results of [:toString():].
 */

check(String str) {
  try {
    new Date.fromString(str);
    Expect.fail("IllegalArgumentException is expected");
  } catch(IllegalArgumentException e) {}
}

main() {
  check("-2001-1-1 0:0:0.0"); //Why is incorrect to set negative year?
  check("2001-0-1 0:0:0.0");
  check("2001-13-1 0:0:0.0");
  check("2001-1-0 0:0:0.0");
  check("2001-1-32 0:0:0.0");
  check("2001-1-1 25:0:0.0");
  check("2001-1-1 0:60:0.0");
  check("2001-1-1 0:0:60.0");
  check("2001-1-1 0:0:0.1000");
  check("2001-s-1 0:0:0.0");
  check("s-t-r i:n:g.");
}
