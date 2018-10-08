/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * int terminalLines
 * If no terminal is attached to stdout, a StdoutException is thrown.
 * @description Checks that exception is thrown if there is no attached
 * terminal.
 * @author iarkh@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  if (!stderr.hasTerminal) {
    Expect.throws(() => stderr.terminalLines, (e) => e is StdoutException);
  }
  if (!stdout.hasTerminal) {
    Expect.throws(() => stdout.terminalLines, (e) => e is StdoutException);
  }
}
