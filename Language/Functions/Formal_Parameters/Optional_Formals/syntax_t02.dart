/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Optional parameters may be specified and provided with default
 * values.
 * defaultFormalParameter:
 *   normalFormalParameter ('=' expression)?
 * ;
 * defaultNamedParameter:
 *   normalFormalParameter (':' expression)?
 * ;
 * @description Checks that optional arguments are assigned their default values
 * when not specified in the invocation expression.
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */
import "../../../../Utils/expect.dart";

void func([var x = 1, var y = 2]) {
  Expect.equals(1, x);
  Expect.equals(2, y);
}

void func2({var x: 1, var y: 2}) {
  Expect.equals(1, x);
  Expect.equals(2, y);
}

main() {
  func();
  func(1);

  func2();
  func2(x: 1);
  func2(y: 2);
}
