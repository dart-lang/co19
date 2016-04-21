/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A label is an identifier followed by a colon. A labeled statement
 * is a statement prefixed by a label L. A labeled case clause is a case clause
 * within a switch statement prefixed by a label L.
 * The sole role of labels is to provide targets for the break and continue
 * statements.
 * label:
 *   identifier ':'
 * ;
 * @description Checks that it is not a compile-time error when a label is used
 * next to all kinds of statements.
 * @author rodionov
 * @reviewer iefremov
 */

main() {
  A: {
    B: var x = 1;
    C: 1 + 2;
  }

  D: if (true) {}

  E: for (;;) {
    F: break;
  }

  G: for (int i in [1,2]) {
    break;
  }

  H: while (false) {
    HH: continue;
  }

  I: do {} while (false);

  J:
  switch (1) {
    K:
    case 2:
    L:
    case 1:
      break;
    case 0:
    M:
    default:
      N: var x = 0;
  }

  O: try {
    P: 2 + 2;
    Q: throw "";
  } catch (ok) {}

  R: assert (true);

  Z: return;
}
