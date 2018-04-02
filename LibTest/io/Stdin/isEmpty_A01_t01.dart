/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isEmpty
 * Reports whether this stream contains any elements.
 * @description Checks that stream contain any elements after some input line is
 * entered in [stdin]
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process() async {
  await stdin.isEmpty.then((empty) { exit(empty ? 99 : 0); });
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.start(executable, [eScript, "test"], runInShell: true).then(
      (Process process) async {
    process.stdin.write("123");
    await process.exitCode.then((code) {
      Expect.equals(0, code);
      called++;
    });
  });
  Expect.equals(1, called);
}

main(List<String> args) { args.length > 0 ? run_process() : run_main(); }
