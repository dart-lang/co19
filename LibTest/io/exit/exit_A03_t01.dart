/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void exit(int code)
 * The handling of exit codes is platform specific.
 * On Linux and OS X an exit code for normal termination will always be in the
 * range [0..255]. If an exit code outside this range is set the actual exit
 * code will be the lower 8 bits masked off and treated as an unsigned value.
 * E.g. using an exit code of [-1] will result in an actual exit code of [255]
 * being reported.
 * @description Checks that on Linux OS exit codes in the [0..255] range are
 * returned as is
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
  if(!Platform.isWindows) {
    if (args.length > 0)
      run_process(int.parse(args[0]));
    else {
      for (int i = 0; i < 10; i++) run_main(i);
      run_main(100);
      run_main(200);
      run_main(254);
      run_main(255);
    }
  }
}
