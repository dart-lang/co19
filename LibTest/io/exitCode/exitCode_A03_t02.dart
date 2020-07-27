/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int exitCode
 * Default value is [0].
 * @description Checks that Dart process returns [0] if [exitCode] was never
 * changed.
 * @author iarkh@unipro.ru
 */
// For now (27/07/2020) we cannot use Expect because it's migrated to null
// safety but process, that run this test, don't have null safety and therefore
// compile error occurs (exit code 254)
//import "../../../Utils/expect.dart";
import "dart:io";

run_process() { print("Hello, World!"); }

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(executable, [eScript, "run"]).then((ProcessResult results) {
    if (results.exitCode != 0) {
      throw new Exception("Wrong exit code <${results.exitCode}>");
    }
    //Expect.equals(0, results.exitCode);
    called++;
  });
  if (called != 1) {
    throw new Exception("Called must be <1> but actually <$called>");
  }
  //Expect.equals(1, called);
}

main(List<String> args) {
  if(args.length > 0)
    run_process();
  else {
    run_main();
  }
}
