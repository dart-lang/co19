/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int pid
 * Returns the [PID] of the current process.
 * @description Checks that [pid] is [PID} of the current Dart process.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

run_process() { print(pid); }

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  bool called = false;
  await Process.run(executable, [eScript, "run"]).then((ProcessResult results) {
    Expect.equals(results.pid, int.parse(results.stdout));
    called = true;
  });
  Expect.isTrue(called);
}

main(List<String> args) {
  if(args.length > 0)
    run_process();
  else {
    run_main();
  }
}
