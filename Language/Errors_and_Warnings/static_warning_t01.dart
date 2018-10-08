/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static warnings are those errors reported by the static checker.
 * They have no effect on execution
 * @description Checks that static warning has no effect on execution
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
import '../../Utils/expect.dart';

class C {
  C() { }
  int foo() {
    if (true) {
      return 1;
    } else {
      return; /// static type warning
    }
  }
}

main() {
  new C().foo();
  Expect.isTrue(true);
}
