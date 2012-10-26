/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The expression e is evaluated to an object o. Then, o is subjected
 *  to boolean conversion (11.4.1), producing an object r. If r is true, then s
 *  is executed and then the while statement is re-executed recursively.
 *  If r is false, execution of the while statement is complete.
 * @description Checks that no dynamic type error is produced in checked mode if o is not of type bool.
 * @static-warning
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

#import("../../Utils/dynamic_check.dart");

main() {
  while(true) {
    break;
  }

  while(false) {
    break;
  }

  checkTypeError(() {
    while("true") {
      break;
    }
  });

  checkTypeError(() {
    while(1) {
      break;
    }
  });

  if(isCheckedMode()) {
    try {
      while(null) {
        break;
      }
      Expect.fail("Assertion error expected in checking mode");
    } on AssertionError catch(ok) {
    }
  } else {
    while(null) {
      break;
    }
  }
}

