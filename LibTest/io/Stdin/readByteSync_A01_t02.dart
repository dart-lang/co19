// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int readByteSync()
/// Synchronously read a byte from stdin.
/// @description Checks that bytes are read from [stdin] one-by-one
/// @author iarkh@unipro.ru

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

Future<ProcessResult> run_Windows(
    String executable, String executableArgs, String script) {
  return Process.run(
      "echo", ["abc", "|", executable, executableArgs, script, "test"],
      runInShell: true);
}

Future<ProcessResult> run_Linux(
    String executable, String executableArgs, String script) {
  return Process.run(
      "bash",
      [
        "-c",
        "echo abc | " +
            executable +
            " " +
            executableArgs +
            " " +
            script +
            " test"
      ],
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
  String executableArgs = Platform.executableArguments.join(" ");
  int called = 0;
  await (Platform.isWindows
          ? run_Windows(executable, executableArgs, eScript)
          : run_Linux(executable, executableArgs, eScript))
      .then((ProcessResult results) {
    called++;
    Expect.equals(Platform.isWindows ? "" : "979899", results.stdout);
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  args.length > 0 ? run_process() : run_main();
}
