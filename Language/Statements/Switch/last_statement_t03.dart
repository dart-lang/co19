/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the last statement of the statement
 * sequence sk is not a break, continue, return or throw statement.
 * @description Checks that it is no compile error if the last statement of the
 * statement sequence of the default clause is not a break, continue, return or
 * throw statement.
 * @author msyabro
 * @reviewer rodionov
 * @issue 7537
 */

main() {
  switch (1) {
    case 0: false;
      break;
    default: true;
  }
}
