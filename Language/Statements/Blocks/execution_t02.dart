/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A block statement supports sequencing of code.
 * Execution of a block statement { s1, ... , sn } proceeds as follows:
 * For i in 1..n; si is executed.
 * @description Checks that contents of a block statement are executed
 * sequentially from top to bottom.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

main() {
  try {
    throw 1;
    throw 2;
    throw 3;
  } catch (e) {
    Expect.equals(1, e);
  }
}

