/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LIBRARY dart:io
 * Stdout stdout
 * The standard output stream of data written by this program.
 * @description Checks that [stdout] contains standard output of the current
 * process
 * @author iarkh@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

run_process() { stdout.write('Test'); }

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(executable, [eScript, 'run']).then((ProcessResult results) {
    Expect.equals("Test", results.stdout);
    called++;
  });
  Expect.equals(1, called);
}

main(List<String> args) async {
  if(args.length > 0 && args[0] == 'run')
    run_process();
  else
    run_main();
}
