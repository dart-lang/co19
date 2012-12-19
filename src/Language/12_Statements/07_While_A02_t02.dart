/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The expression e is evaluated to an object o. Then, o is subjected
 *  to boolean conversion, producing an object r. If r is true, then s
 *  is executed and then the while statement is re-executed recursively.
 *  If r is false, execution of the while statement is complete.
 * @description Checks that no dynamic type error is produced in checked mode
 * if o is not null and not of type bool.
 * Checks that dynamic type error is produced in checked mode if o is null.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

import "../../Utils/dynamic_check.dart";

main() {
  while(true) {
    break;
  }

  while(false) {
    break;
  }

  checkTypeError(() {
    while("true") { /// static type warning
      break;
    }
  });

  checkTypeError(() {
    while(1) { /// static type warning
      break;
    }
  });

  if(isCheckedMode()) {
    bool fail = false;
    try {
      while(null) {
        break;
      }
      fail = true;
    } on AssertionError catch(ok) {
    }
    Expect.isFalse(fail, "AssertionError expected in checking mode");
  } else {
    while(null) {
      break;
    }
  }
}
