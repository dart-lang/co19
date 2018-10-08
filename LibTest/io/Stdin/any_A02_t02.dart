/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Completes the [Future] when the answer is known.
 * @description Checks that that [Future] is not completed while the answer is
 * unknown
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

bool test(s) { return (new String.fromCharCodes(s)).startsWith("Test"); }

run_process() async {
  await stdin.any(test).then((x) { exit(99); });
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;

  await Process.start(executable, [eScript, "test"], runInShell: true).then(
      (Process process) async {
    process.stdin.writeln("1");
    process.stdin.flush();
    await new Future.delayed(new Duration(seconds: 2)).then((_) async {
      process.kill();
      await process.exitCode.then((code) async {
        Expect.notEquals(99, code);
        called++;
      });
    });
  });
  Expect.equals(1, called);
}

main(List<String> args) { args.length > 0 ? run_process() : run_main(); }
