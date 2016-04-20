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
 * @description Checks using optional parameters together with required ones
 * @author kaigorodov
 * @reviewer iefremov
 * @reviewer rodionov
 */
import "../../../../Utils/expect.dart";

void func(int z, [var x = 1, var y = 2]) {
  Expect.equals(7, z);
  Expect.equals(1, x);
  Expect.equals(2, y);
}

void func2(int z, {var x: 1, var y: 2}) {
  Expect.equals(7, z);
  Expect.equals(1, x);
  Expect.equals(2, y);
}

main() {
  func(7);
  func(7, 1);
  func(7, 1, 2);

  func2(7);
  func2(7, x: 1);
  func2(7, y: 2);
  func2(7, x: 1, y: 2);
  func2(7, y: 2, x: 1);
}
