/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int exitCode
 * Get the global exit code for the Dart VM.
 * The exit code is global for the Dart VM and the last assignment to [exitCode]
 * from any isolate determines the exit code of the Dart VM on normal
 * termination.
 * @description Checks that process returns [exitCode] when finishes normally.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process() { exitCode = 123; }

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(executable, [eScript, "run"]).then((ProcessResult results) {
    Expect.equals(123, results.exitCode);
    called++;
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  if(args.length > 0)
    run_process();
  else {
    run_main();
  }
}
