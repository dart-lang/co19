/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The scope of a label that labels a statement s is s. The scope of
 * a label that labels a case clause of a switch statement s is s.
 * @description Checks that a labeled statement nested inside another labeled
 * statement can override a label from the enclosing scope by using the same
 * identifier.
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

main() {
  bool flag = false;
  L: do {
    L: for (int i in [1, 2]) {
      break L;
    }
    flag = true;
  } while (false);
  Expect.isTrue(flag);

  flag = false;
  L: for (int i in [1, 2]) {
    switch (i) {
      L:
      case 0:
        flag = true;
        break;
      case 2:
        continue L;
    }
  };
  Expect.isTrue(flag);

  flag = false;
  switch (1) {
    L: case 0:
      Expect.fail("This code shouldn't be executed");
      break;

    default:
      L: do {
        switch (1) {
          L: case 0:
            flag = true;
            break;

          default:
            continue L;
        }
      } while (false);
      break;
  }
  Expect.isTrue(flag);
}
