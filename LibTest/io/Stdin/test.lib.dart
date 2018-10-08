/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_main(String filename, void run(Process _), String expected) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;

  await Process.start(executable, [eScript, filename], runInShell: true).then(
      (Process process) async {
    run(process);
    await process.exitCode.then((int c) async {
      File fl = new File(filename);
      await fl.readAsString().then((String contents) {
        fl.delete();
        Expect.listEquals(expected.codeUnits, contents.codeUnits);
      });
      called++;
    });
  });
  Expect.equals(1, called);
}

run_main_invalid(String run(Process process)) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;

  await Process.start(executable, [eScript, "test"], runInShell: true).then(
      (Process process) async {
    await run(process);
    await process.exitCode.then((int code) async {
      Expect.equals(99, code);
      called++;
    });
  });
  Expect.equals(1, called);
}
