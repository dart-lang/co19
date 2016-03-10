/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The scope of a label that labels a statement s is s. The scope of
 * a label that labels a case clause of a switch statement s is s.
 * @description Checks that a label can't be referenced outside of its statement.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

main() {
  L: for (int i in [1,2]) {
    break M:
  }

  M: do {
    continue L;
  } while (false);
}
