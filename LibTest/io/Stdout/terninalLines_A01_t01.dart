/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * int terminalLines
 * Get the number of Lines of the terminal.
 * @description Checks that [terminalLines] is a positive number if output is
 * attached to the terminal.
 * @author iarkh@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  if (stderr.hasTerminal) {
    Expect.isTrue(stderr.terminalLines > 0);
  }
  if (stdout.hasTerminal) {
    Expect.isTrue(stdout.terminalLines > 0);
  }
}