/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Boolean conversion is defined by the function
 *   (bool v){
 *      assert(v != null);
 *      return identical(v, true);
 *    }(o)
 * @description Checks that AssertionError is thrown when trying to convert null to bool
 * if asserts are enabled.
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

import "../../../Utils/dynamic_check.dart";

main() {
  if(isCheckedMode()) {
    bool fail = false;
    try {
      if(null) {}
      fail = true;
    } on AssertionError catch(ok) {}
    Expect.isFalse(fail, "AssertError is expected");
  }
}
