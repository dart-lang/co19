/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> first
 * Stops listening to the stream after the first element has been received.
 * Internally the method cancels its subscription after the first element. This
 * means that single-subscription (non-broadcast) streams are closed and cannot
 * be reused after a call to this getter.
 * @description Checks that [first] cannot be called twice.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

Future<String> readOutput(Stream<List<int>> output) async {
  List<List<int>> result = await output.toList();
  if (result.isEmpty) return "";
  return String.fromCharCodes(result.reduce((x, y) => x + y));
}

run_process() async {
  await stdin.first.then((_) async {
    try { await stdin.first; } catch (e) { exit(0); }
  });
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();

  Process process = await
      Process.start(executable, [eScript, "test"], runInShell: true);

  process.stdin.writeln("1");
  await process.stdin.flush();

  try {
    await process.stdin.close();
    int code = await process.exitCode;
    Expect.equals(0, code);
  } catch (e) {
    print("Subprocess failed or exited prematurely!");
    print("Exit code: ${await process.exitCode}");
    print("stdout: " + await readOutput(process.stdout));
    print("stderr: " + await readOutput(process.stderr));
    rethrow;
  }
}

main(List<String> args) { args.length > 0 ? run_process() : run_main(); }
