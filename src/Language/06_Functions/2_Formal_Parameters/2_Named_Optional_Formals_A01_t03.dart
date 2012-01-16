/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Optional parameters may be specified and provided with default values.
 *  defaultFormalParameter:
 *   normalFormalParameter ('=' expression)?
 *  ;
 * @description Checks using named optional parameters together with positional ones
 * @author kaigorodov
 * @reviewer iefremov
 */

void func(int z, [var x = 1, var y = 2]) {
  Expect.equals(7, z);
  Expect.equals(1, x);
  Expect.equals(2, y);
}

main() {
  func(7);
  func(7, 1);
  func(7, x:1);
  func(7, 1, y:2);
  func(7, x:1, y:2);
  func(7, 1, 2);
}