/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LIBRARY dart:io
 * Stdout stderr
 * The standard output stream of errors written by this program.
 * @description Checks that [stderr] contains standard error stream output of
 * the current process.
 * @author iarkh@unipro.ru
 */

import "dart:io";
import "../../../Utils/expect.dart";

bool called = false;

run_process() { stderr.write('Test'); }

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  await Process.run(executable, [eScript, 'run']).then((ProcessResult results) {
    Expect.equals("Test", results.stderr);
    called = true;
  });
  Expect.isTrue(called);
}

main(List<String> args) async {
  if(args.length > 0 && args[0] == 'run')
    run_process();
  else
    run_main();
}
