/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * If this stream reports an error, the [Future] reports that error.
 * @description Checks that [any] throws error if [stdin] does so.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process() async {
  await stdin.first.then((_) async {
    try {
      stdin.any((x) => true);
      exit(99);
    } catch (e) { exit(0); }
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

main(List<String> args) { args.length > 0 ? run_process() : run_main(); }
