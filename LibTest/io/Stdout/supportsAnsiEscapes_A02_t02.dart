/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool supportsAnsiEscapes
 * Currently, a [TERM] environment variable containing the string [xterm] will
 * be taken as evidence that ANSI escape sequences are supported.
 * @description Checks that [supportsAnsiEscapes] is set [true] if [TERM]
 * environment variable is [xterm] in the child process which was started not
 * from terminal.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process() {
  exit(((Platform.environment.containsKey("TERM") &&
      Platform.environment["TERM"] == "xterm")) == stdout.supportsAnsiEscapes ?
    0 : 1);
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = -1;
  await Process.run(executable, [eScript, "test"],
      runInShell: true).then((ProcessResult results) {
    called = results.exitCode;
    if (called != 0 && called != 1) print(results.stderr);
  });
  Expect.isTrue(called == 0 || called == 1);
}

main(List<String> args) {
  args.length > 0 ? run_process() : run_main();
}
