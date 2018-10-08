/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Used in lock and unlock tests.
 * @author ngl@unipro.ru
 */
library lock_check_1_lib;

import "dart:io";
import "../../../Utils/expect.dart";

// Check whether the file is locked or not.
checkLock(String path, int start, int end, FileLock mode, {bool locked}) {
  // Client process returns either 'LOCK FAILED' or 'LOCK SUCCEEDED'.
  var expected = locked ? 'LOCK FAILED' : 'LOCK SUCCEEDED';
  var arguments = new List<String>()
    ..add(Platform.script.resolve('lock_check_1_lib.dart').toFilePath())
    ..add(path)
    ..add(mode == FileLock.exclusive ? 'EXCLUSIVE' : 'SHARED')
    ..add('$start')
    ..add('$end');


  return Process
      .run(Platform.executable, arguments)
      .then((ProcessResult result) {
    if (result.exitCode != 0 || !result.stdout.contains(expected)) {
      print("Client failed, exit code ${result.exitCode}");
      print("  stdout:");
      print(result.stdout);
      print("  stderr:");
      print(result.stderr);
      print("  arguments:");
      print(arguments);
      Expect.fail('Client subprocess exit code: ${result.exitCode}');
    }
  });
}

checkLocked(String path,
    [int start = 0, int end = -1, FileLock mode = FileLock.exclusive]) =>
    checkLock(path, start, end, mode, locked: true);

checkUnlocked(String path,
    [int start = 0, int end = -1, FileLock mode = FileLock.exclusive]) =>
    checkLock(path, start, end, mode, locked: false);

main(List<String> args) {
  if (args.length == 0) {
    return 0;
  }
  File file = new File(args[0]);
  int start = null;
  int end = null;
  var mode = FileLock.exclusive;
  if (args[1] == 'SHARED') {
    mode = FileLock.shared;
  }
  if (args[2] != 'null') {
    start = int.parse(args[2]);
  }
  if (args[3] != 'null') {
    end = int.parse(args[3]);
  }
  var raf = file.openSync(mode: APPEND);
  try {
    raf.lockSync(mode, start, end);
    print('LOCK SUCCEEDED');
  } catch (e) {
    print('LOCK FAILED');
  } finally {
    raf.closeSync();
  }
}
