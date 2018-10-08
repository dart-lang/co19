/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int readByteSync()
 * Synchronously read a byte from stdin.
 * @description Checks that bytes are read from [stdin] one-by-one
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

Future<ProcessResult> run_Windows(String executable, String script) {
  return Process.run("echo", ["abc", "|", executable, script, "test"],
      runInShell: true);
}

Future<ProcessResult> run_Linux(
    String executable, String script) {
  return Process.run(
      "bash", ["-c", "echo abc | " + executable + " " + script + " test"],
      runInShell: true);
}

run_process() {
  stdout.write(stdin.readByteSync());
  stdout.write(stdin.readByteSync());
  stdout.write(stdin.readByteSync());
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await (Platform.isWindows ? run_Windows(executable, eScript) :
      run_Linux(executable, eScript)).then((ProcessResult results) {
    called++;
    Expect.equals("979899", results.stdout);
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  args.length > 0 ? run_process() : run_main();
}
