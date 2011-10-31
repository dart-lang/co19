/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that the line is recorded correctly when the TypeError is raised.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview Mark this test for checked mode only.
 */

main() {
  try {
    int x = true; // this is line 16
    Expect.fail("TypeError expected");
  } catch (TypeError e) {
    Expect.equals(16, e.line);
  }
}
