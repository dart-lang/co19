/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void exit(int code)
 * On Windows the exit code can be set to any 32-bit value.
 * @description Checks that on Windows any exit code is returned as is.
 * range are

 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process(i) { exit(i); }

run_main(int i) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(executable,
      [eScript, i.toString()]).then((ProcessResult results) {
    Expect.equals(i, results.exitCode);
    called++;
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  if(Platform.isWindows) {
    if (args.length > 0)
      run_process(int.parse(args[0]));
    else {
      for (int i = 0; i < 10; i++) run_main(i);
      run_main(100);
      run_main(200);
      run_main(254);
      run_main(255);
      run_main(400);
      run_main(10000);
      run_main(65565);
      run_main(-1);
      run_main(-20000);
      run_main(-65564);
      run_main(-60000000);
    }
  }
}
