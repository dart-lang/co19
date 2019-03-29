/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A shift expression of the form e1 op e2 is equivalent
 * to the method invocation e1.op(e2).
 * @description Checks that an expressions of the form e1 << e2
 * is equivalent to the method invocation e1.operator<<(e2).
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=triple-shift

import '../../../Utils/expect.dart';

var logStr = "";

class A {
  operator >>>(var v) {
    logStr = "${logStr}>>>";
    return true;
  }
}

main() {
  logStr = "";
  A a = new A();
  a >>> 1;
  Expect.equals(">>>", logStr);
}
