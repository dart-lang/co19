/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int toInt()
 * @description Checks that [:toInt():] throws some error or exception when called on a NaN.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  double nan = 0 / 0;
  bool fail = false;
  try {
    nan.toInt();
    fail = true;
  } catch(e) {}
  Expect.isFalse(fail, "Error or exception expected");
}
