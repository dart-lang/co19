/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int toInt()
 * @description Checks that [:toInt():] throws an exception when called on infinity.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  double inf = 1 / 0;

  try {
    inf.toInt();
    Expect.fail("Expected BadNumberFormatException");
  } catch (BadNumberFormatException e) {}

  try {
    (-inf).toInt();
    Expect.fail("Expected BadNumberFormatException");
  } catch (BadNumberFormatException e) {}
}
