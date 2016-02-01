/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A shift expression of the form super op e2 is equivalent
 * to the method invocation super.op(e2).
 * @description Checks that an expressions of the form super << e2
 * is equivalent to the method invocation super.operator<<(e2).
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

var logStr = "";

class S {
  operator <<(var v) {
    logStr = "${logStr}<<";
    return true;
  }
  operator >>(var v) {
    logStr = "${logStr}>>";
    return true;
  }
}

class A extends S {
  test() {
    logStr = "";
    super << 1;
    super >> 1;
    Expect.equals("<<>>", logStr);
  }
}

main() {
  A a = new A();
  a.test();
}
