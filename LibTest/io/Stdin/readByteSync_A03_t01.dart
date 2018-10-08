/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int readByteSync()
 * If at end of file, [-1] is returned.
 * @description Checks that [-1] is returned if no there is any input actually.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process() {
  stdout.write(stdin.readByteSync());
}

run_main() async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(executable, [eScript, "test"],
      runInShell: true).then((ProcessResult results) {
    called++;
    Expect.equals("-1", results.stdout);
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  args.length > 0 ? run_process() : run_main();
}
