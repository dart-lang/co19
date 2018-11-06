/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int readByteSync()
 * This call will block until a byte is available.
 * @description Checks that call is blocked until a byte is available.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";
import "stdin_utils.dart";

run_process() async {
  // Read and print the first byte ([5])
  stdout.write(stdin.readByteSync());
  // Try to read and print the second byte (no input here, [-1] passes when
  // process finishes) - all is blocked before
  stdout.write(stdin.readByteSync());
  // print [OK] finally
  print("OK");
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;

  await Process.start(executable, [eScript, "test"], runInShell: true).then(
      (Process process) async {
    process.stdin.add([5]);
    await new Future.delayed(new Duration(seconds: 2)).then((_) async {
      process.kill();
      await process.exitCode.then((_) async {
        process.stderr.toList().then((errors){
          Expect.isTrue(errors.isEmpty);
        });
        await process.stdout.toList().then((out) {
          // Expected result is: [5-1OK] string
          Expect.listEquals([53, 45, 49, 79, 75, 10], flattenList<int>(out));
          called++;
        });
      });
    });
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  args.length > 0 ? run_process() : run_main();
}
