/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The scope of a label that labels a statement s is s. The scope of
 * a label that labels a case clause of a switch statement s is s.
 * @description Checks that it is a compile-time error when multiple cases of
 * the same switch statement have labels with the same identifier.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

main() {
  try {
    switch (1) {
      Label:
      case 1:
        break;

      case 2:
        break;

      case 3:
        break;

      Label:
      default:
        break;
    }
  } catch (x) {}
}
