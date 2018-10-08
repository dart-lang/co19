/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> first
 * If this stream is empty (a [done] event occurs before the first data event),
 * the resulting future completes with a [StateError].
 * @description Checks that [StateError] occurs if the stream is empty
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process() async {
  await stdin.first.then((_) async {
    try {
      await stdin.first;
      exit(99);
    } catch (e) {
      exit(e is StateError ? 0 : 99);
    }
  });
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;

  await Process.start(executable, [eScript, "test"], runInShell: true).then(
      (Process process) async {
    process.stdin.writeln("1");
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

