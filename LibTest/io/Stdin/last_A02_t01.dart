/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> last
 * Returns the last element of the stream.
 * @description Checks that last entered line is returned
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process() {
  stdin.last.then((List<int> l) { print(new String.fromCharCodes(l)); });
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;

  await Process.start(executable, [eScript, "test"], runInShell: true).then(
      (Process process) async {
    process.stdin.writeln("Testme");
    process.stdin.close();
    await process.stderr.toList().then((errors){
      Expect.isTrue(errors.isEmpty);
    });
    await process.stdout.transform(systemEncoding.decoder).join().then((out) {
      Expect.isTrue("Testme".startsWith(out[0].trimRight()));
      called++;
    });
  });
  Expect.equals(1, called);
}

main(List<String> args) { args.length > 0 ? run_process() : run_main(); }
