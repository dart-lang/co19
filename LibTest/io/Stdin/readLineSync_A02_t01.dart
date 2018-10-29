/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String readLineSync({
 *   Encoding encoding: systemEncoding,
 *   bool retainNewlines: false
 *   })
 * This call will block until a full line is available.
 * @description Checks that the call is blocked until a full line is available.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";
import "stdin_utils.dart";

run_process() {
  stdout.write("Start");
  String str = stdin.readLineSync();
  stdout.write(str);
  stdout.write("End");
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;

  await Process.start(executable, [eScript, "test"], runInShell: true).then(
      (Process process) async {
    process.stdin.write("1");
    await new Future.delayed(new Duration(seconds: 2)).then((_) async {
      // Wait some time: call should be blocked until no new line in stdin
      process.stdin.writeln("2");
    });
    await process.exitCode.then((_) async {
      await process.stdout.toList().then((out) {
        // Correct substring sequence should be: Start -> 1 -> 2 -> End
        Expect.listEquals([83, 116, 97, 114, 116, 49, 50, 69, 110, 100],
            flattenList<int>(out));
        called++;
      });
    });
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  args.length > 0 ? run_process() : run_main();
}
