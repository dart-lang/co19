/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int readByteSync()
 * @assertion String readLineSync({
 *   Encoding encoding: systemEncoding,
 *   bool retainNewlines: false
 *   })
 * If [retainNewlines] is [false], the returned [String] will not contain the
 * final [newline]. If [true], the returned [String] will contain the line
 * terminator. Default is [false].
 * @description Check that if [retainNewlines] is [true], the returned [String]
 * contains [newLine] in the end
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process() { stdout.write(stdin.readLineSync(retainNewlines: true)); }

run_main() async {
  const CR = 13;
  const LF = 10;

  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;

  await Process.start(executable, [eScript, "test"], runInShell: true).then(
      (Process process) async {
    process.stdin.writeln("Hello");
    await process.stdout.toList().then((out) {
      Expect.isTrue((out[0][out[0].length - 1] == CR) ||
          (out[0][out[0].length - 1] == LF));
      called++;
    });
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  args.length > 0 ? run_process() : run_main();
}
