/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Checks whether [test] accepts any element provided by this stream.
 * @description Checks that [any] always returns [false] if there is no entered
 * lines in [stdin].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process() async {
  await stdin.any((x) => true).then((x) { exit(x ? 99 : 0); });
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;

  await Process.start(executable, [eScript, "test"], runInShell: true).then(
      (Process process) async {
    process.stdin.close();
    await process.exitCode.then((int code) async {
      Expect.equals(0, code);
      called++;
    });
  });
  Expect.equals(1, called);
}

main(List<String> args) { args.length > 0 ? run_process() : run_main(); }
