/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A cascaded method invocation expression of the form e..suffix
 * is equivalent to the expression (t){t.suffix; return t;}(e).
 * @description Checks that a cascaded expression evaluates suffix and returns
 * the value of e.
 * @author msyabro
 * @reviewer iefremov
 */
import '../../../../Utils/expect.dart';

bool visited = false;

class C {
  method() {
    visited = true;
    return null;
  }
}

main() {
  var o = new C();
  var result = o..method();
  Expect.isTrue(visited, "Cascaded expression was not evaluated!");
  Expect.identical(o, result, "Cascaded expression returned wrong value!");
}

