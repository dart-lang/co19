/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the last statement of the statement sequence sk
 * is not a break, continue, return or throw statement.
 * @description Checks that it is a static warning if the last statement of the statement
 * sequence of a case clause is not a break, continue, return or throw statement.
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  try {
    switch(1) {
      case 0: false; /// static warning SWITCH_CASE_FALL_THROUGH
      case 1: true;
              break;
    }
  } catch(ok) {}
}
