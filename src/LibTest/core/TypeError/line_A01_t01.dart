/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that the line is recorded correctly when the TypeError is raised.
 * @static-warning
 * @author rodionov
 * @reviewer msyabro
 */
import "../../../Utils/dynamic_check.dart";

main() {
  if(isCheckedMode()) {
    try {
      // the following line must be no. 19:
      int x = true;  /// static type warning 
      Expect.fail("TypeError expected");
    } on TypeError catch(e) {
      Expect.equals(19, e.line);
    }
  }
}
