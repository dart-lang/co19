/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static warnings are those errors reported by the static checker.
 * They have no effect on execution
 * @description Checks that static warning in class method has
 * no effect on execution in production mode
 * @static-warning
 * @author sgrekhov@unipro.ru
 */

import '../../Utils/expect.dart';
import '../../Utils/dynamic_check.dart';

class C {
  void m() {
    while ("") { // static type warning
    }
  }
}

main() {
  if (!isCheckedMode()) {
    int i = 0;
    try {
      C c = new C();
      c.m();
      i++;
    } catch (e) {
      Expect.fail("No exeption should be thrown");
    }
    Expect.equals(1, i, "There should be no effect on execution");
  }
}
