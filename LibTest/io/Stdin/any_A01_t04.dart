// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Future<bool> any(bool test(T element))
/// Checks whether [test] accepts any element provided by this stream.
/// @description Checks that [any] returns [true] for custom [test] function if
/// several lines were entered and read from [stdin].
/// @author iarkh@unipro.ru

import "../../../Utils/expect.dart";
import "dart:io";

bool test(s) {
  return (new String.fromCharCodes(s)).contains("4");
}

run_process() async {
  await stdin.any(test).then((x) {
    exit(x ? 0 : 99);
  });
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;

  await Process.start(
          executable, [...Platform.executableArguments, eScript, "test"],
          runInShell: true)
      .then((Process process) async {
    process.stdin.writeln("1");
    process.stdin.writeln("2");
    process.stdin.writeln("3");
    process.stdin.writeln("4");
    process.stdin.writeln("5");
    process.stdin.flush();
    await process.exitCode.then((int code) async {
      Expect.equals(0, code);
      called++;
    });
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  args.length > 0 ? run_process() : run_main();
}
