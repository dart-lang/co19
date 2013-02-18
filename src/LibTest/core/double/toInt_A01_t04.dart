/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int toInt()
 * @description Checks that [:toInt():] throws an error or exception when called on infinity.
 * @author pagolubev
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";


main() {
  double inf = 1 / 0;
  bool fail = false;

  try {
    inf.toInt();
    fail = true;
  } catch(e) {}
  Expect.isFalse(fail, "Error or exception expected");

  fail = false;
  try {
    (-inf).toInt();
    fail = true;
  } catch(e) {}
  Expect.isFalse(fail, "Error or exception expected");
}
