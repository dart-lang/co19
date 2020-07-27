/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int exitCode
 * See [exit] for more information on how to chose a value for the exit code.
 * @description Checks that exit code [-1] is processed correctly.
 * @author iarkh@unipro.ru
 */
// For now (27/07/2020) we cannot use Expect because it's migrated to null
// safety but process, that run this test, don't have null safety and therefore
// compile error occurs (exit code 254)
// import "../../../Utils/expect.dart";
import "dart:io";

run_process() {
  exitCode = -1;
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(executable, [eScript, "run"]).then((ProcessResult results) {
    if (results.exitCode != (Platform.isWindows ? -1 : 255)) {
      throw new Exception("Wrong exit code <${results.exitCode}>");
    }
    //Expect.equals(Platform.isWindows ? -1 : 255, results.exitCode);
    called++;
  });
  if (called != 1) {
    throw new Exception("Called must be <1> but actually <$called>");
  }
  //Expect.equals(1, called);
}

main(List<String> args) {
  if (args.length > 0)
    run_process();
  else {
    run_main();
  }
}
