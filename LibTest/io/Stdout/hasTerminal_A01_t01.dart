/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasTerminal
 * Returns true if there is a terminal attached to stdout.
 * @description Checks [hasTerminal] property correctness for [stdout].
 * @author iarkh@unipro.ru
 */

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  if (stdout.hasTerminal) {
    Expect.notEquals(0, stdout.terminalColumns);
    Expect.notEquals(0, stdout.terminalLines);
  } else {
    Expect.throws(() => stdout.terminalColumns, (e) => e is StdoutException);
    Expect.throws(() => stdout.terminalLines, (e) => e is StdoutException);
  }
}
