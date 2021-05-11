// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int readByteSync()
/// Synchronously read a byte from stdin.
/// @description Checks that byte is read from [stdin]
/// @author iarkh@unipro.ru

import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

Future<ProcessResult> run_Windows(
    String executable, String executableArgs, String script) {
  return Process.run(
      "echo", ["a", "|", executable, executableArgs, script, "test"],
      runInShell: true);
}

Future<ProcessResult> run_Linux(
    String executable, String executableArgs, String script) {
  return Process.run(
      "bash",
      [
        "-c",
        "echo a | " + executable + " " + executableArgs + " " + script + " test"
      ],
      runInShell: true);
}

run_process() {
  exit(stdin.readByteSync());
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  String executableArgs = Platform.executableArguments.join(" ");
  int called = -1;
  await (Platform.isWindows
          ? run_Windows(executable, executableArgs, eScript)
          : run_Linux(executable, executableArgs, eScript))
      .then((ProcessResult results) {
    called = results.exitCode;
  });
  if (Platform.isWindows) {
    Expect.isTrue(called == 254 || called == 255);
  } else {
    Expect.equals(97, called);
  }
}

main(List<String> args) {
  args.length > 0 ? run_process() : run_main();
}
