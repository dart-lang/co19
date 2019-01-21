/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
import "dart:async";
import "dart:io";

import "../../../Utils/expect.dart";
import "../file_utils.dart";

run_main(FutureOr<void> run(Process _), String expected) async {
  final String executable = Platform.resolvedExecutable;
  final String eScript = Platform.script.toString();
  int called = 0;

  final sandbox = getTempDirectorySync();
  final filename = getTempFilePath(parent: sandbox);

  try {
    final process = await Process.start(executable, [eScript, filename],
        runInShell: true);
    await run(process);
    await process.exitCode;
    final fl = new File(filename);
    final contents = await fl.readAsString();
    Expect.listEquals(expected.codeUnits, contents.codeUnits);
    called++;
  } finally {
    await sandbox.delete(recursive: true);
  }
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
