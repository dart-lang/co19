/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that the line is recorded correctly when the AssertionError
 *              is raised using the assert statement.
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
    assert(true == false); // this is line 22
    Expect.fail("AssertionError expected");
  } on AssertionError catch(e) {
    Expect.equals(22, e.line);
  }
}
