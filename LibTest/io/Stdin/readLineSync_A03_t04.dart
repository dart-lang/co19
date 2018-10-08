/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String readLineSync({
 *   Encoding encoding: systemEncoding,
 *   bool retainNewlines: false
 *   })
 * The argument [encoding] can be used to changed how the input should be
 * decoded.
 * @description Checks that trying to read a string with [null] encoding causes
 * error.
 * @author iarkh@unipro.ru
 */

import "dart:io";
import "test.lib.dart";

run_process(String filename) {
  try {
    stdin.readLineSync(encoding : null);
  } catch (error) { exit(99); };
}

String run(Process process) {
  process.stdin.writeln("test");
  return "test";
}

main(List<String> args) {
  args.length > 0 ? run_process(args[0]) : run_main_invalid(run);
}
