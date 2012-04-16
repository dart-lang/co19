/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that the column is recorded correctly when the TypeError is raised.
 * @static-warning
 * @author rodionov
 * @reviewer msyabro
 */

#import("../../../Utils/dynamic_check.dart");

main() {
  if(isCheckedMode()) {
    try {
      int x = true;
      Expect.fail("TypeError expected");
    } catch (TypeError e) {
      Expect.equals(15, e.column);
    }
  }
}
