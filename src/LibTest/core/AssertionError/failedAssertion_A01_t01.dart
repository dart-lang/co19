/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that the assertion text is recorded correctly.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */

#import("../../../../Utils/dynamic_check.dart");

main() {
  if(!isCheckedMode()) {
    return;
  }
  try {
    assert(true == false);
    Expect.fail("AssertionError expected");
  } catch (AssertionError e) {
    Expect.equals("true == false", e.failedAssertion);
  }
}
