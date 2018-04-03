/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Stops listening to the stream after the first matching element has been
 * found.
 * Internally the method cancels its subscription after the first element. This
 * means that single-subscription (non-broadcast) streams are closed and cannot
 * be reused after a call to this getter.
 * @description Checks that [any] stops the listening for [stdin].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process() async {
  await stdin.any((x) => true).then((_) async {
    try { stdin.listen((_) { exit(99); }); } catch (e) { exit(0); }
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
