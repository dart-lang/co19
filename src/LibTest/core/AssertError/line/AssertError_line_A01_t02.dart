/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that the line is recorded correctly when the AssertError
 *              is raised using the assert statement.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview Mark this test for checked mode only.
 */
 
main() {
  try {
    assert(true == false); // this is line 17
    Expect.fail("AssertError expected");
  } catch (AssertError e) {
    Expect.equals(17, e.line);
  }
}
