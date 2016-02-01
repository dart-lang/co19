/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A relational expression of the form e1 op e2 is equivalent to
 * the method invocation e1.op(e2).
 * @description Checks that a relational expression of the form e1 < e2
 * is equivalent to the method invocation e1.operator<(e2).
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

var logStr = "";

class A {
  operator <(var v) {
    logStr = "${logStr}<";
    return true;
  }
  operator >(var v) {
    logStr = "${logStr}>";
    return true;
  }
  operator <=(var v) {
    logStr = "${logStr}<=";
    return true;
  }
  operator >=(var v) {
    logStr = "${logStr}>=";
    return true;
  }
}

main() {
  logStr = "";
  A a = new A();
  a < 1;
  a > 1;
  a <= 1;
  a >= 1;
  Expect.equals("<><=>=", logStr);
}
