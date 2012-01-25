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
 * @description Checks that arguments are assigned to default values.
 * @author msyabro
 * @reviewer kaigorodov
 */

void func([var x = 1, var y = 2]) {
  Expect.equals(1, x);
  Expect.equals(2, y);
}

main() {
  func();
  func(1);
  func(y: 2);
}