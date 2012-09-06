/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Boolean conversion maps any object o into a boolean defined as
 * (bool v){
 *   assert(v != null);
 *   return v === true;
 * }(o)
 * @description Checks that AssertionError is thrown when trying to convert null to bool
 * if asserts are enabled.
 * @author msyabro
 * @reviewer rodionov
 */

#import("../../../Utils/dynamic_check.dart");

main() {
  if(isCheckedMode()) {
    try {
      if(null) {}
      Expect.fail("AssertError is expected");
    } on AssertionError catch(ok) {}
  }
}
