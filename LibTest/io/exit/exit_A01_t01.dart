/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void exit(int code)
 * Exit the Dart VM process immediately with the given exit code.
 * @description Checks that process returns given code after the [exit] call.
 * @author iarkh@unipro.ru
 */
// For now (27/07/2020) we cannot use Expect because it's migrated to null
// safety but process, that run this test, don't have null safety and therefore
// compile error occurs (exit code 254)
//import "../../../Utils/expect.dart";
import "dart:io";

run_process() {
  exit(123);
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(executable, [eScript, "run"]).then((ProcessResult results) {
    if (results.exitCode != 123) {
      throw new Exception("Wrong exit code <${results.exitCode}>");
    }
    //Expect.equals(123, results.exitCode);
    called++;
  });
  if (called != 1) {
    throw new Exception("Called must be <1> but actually <$called>");
  }
  //Expect.equals(1, called);
}

main(List<String> args) {
  if(args.length > 0) {
    run_process();
  } else {
    run_main();
  }
}
