/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that the column is recorded correctly when the
 *              AssertionError is raised using assert statement.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */

#import("../../../Utils/dynamic_check.dart");

main() {
  if(!isCheckedMode()) {
    return;
  }
  try {
    assert(true == false);
    // ....^ this is col 12
    Expect.fail("AssertionError expected");
  } on AssertionError catch(e) {
    Expect.equals(12, e.column);
  }
}
