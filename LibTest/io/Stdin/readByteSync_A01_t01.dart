/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int readByteSync()
 * Synchronously read a byte from stdin.
 * @description Checks that byte is read from [stdin]
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

Future<ProcessResult> run_Windows(String executable, String script) {
  return Process.run(
      "echo", ["a", "|", executable, script, "test"], runInShell: true);
}

Future<ProcessResult> run_Linux(
    String executable, String script) {
  return Process.run(
      "bash", ["-c", "echo a | " + executable + " " + script + " test"],
      runInShell: true);
}

run_process() { exit (stdin.readByteSync()); }

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = -1;
  await (Platform.isWindows ? run_Windows(executable, eScript) :
      run_Linux(executable, eScript)).then((ProcessResult results) {
    called = results.exitCode;
  });
  Expect.equals(97, called);
}

main(List<String> args) {
  args.length > 0 ? run_process() : run_main();
}
