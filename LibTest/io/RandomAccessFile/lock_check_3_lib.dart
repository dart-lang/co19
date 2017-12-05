/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Used in lock and unlock tests.
 * @author ngl@unipro.ru
 */
library lock_check_3_lib;

import "dart:io";
import "../../../Utils/expect.dart";

// Check whether the file is locked or not.
checkLock(String path, int start, int end, FileLock mode, {bool locked}) {
  // Client process returns either 'LOCK FAILED' or 'LOCK SUCCEEDED'.
  var expected = locked ? 'LOCK FAILED' : 'LOCK SUCCEEDED';
  var loc_mode;
  switch (mode) {
    case FileLock.SHARED:
      loc_mode = 'SHARED';
      expected = 'LOCK FAILED';
      break;
    case FileLock.EXCLUSIVE:
      loc_mode = 'EXCLUSIVE';
      expected = 'LOCK FAILED';
      break;
    case FileLock.BLOCKING_SHARED:
      loc_mode = 'BLOCKING_SHARED';
      break;
    case FileLock.BLOCKING_EXCLUSIVE:
      loc_mode = 'BLOCKING_EXCLUSIVE';
  }
  var arguments = []
    ..add(Platform.script.resolve('lock_check_3_lib.dart').toFilePath())
    ..add(path)
    ..add(loc_mode)
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
    [int start = 0, int end = -1, FileLock mode = FileLock.EXCLUSIVE]) =>
    checkLock(path, start, end, mode, locked: true);

checkUnlocked(String path,
    [int start = 0, int end = -1, FileLock mode = FileLock.EXCLUSIVE]) =>
    checkLock(path, start, end, mode, locked: false);

main(List<String> args) {
  File file = new File(args[0]);
  int start = null;
  int end = null;
  var mode = FileLock.EXCLUSIVE;
  switch (args[1]) {
    case 'SHARED' : mode = FileLock.SHARED; break;
    case 'BLOCKING_SHARED' : mode = FileLock.BLOCKING_SHARED; break;
    case 'BLOCKING_EXCLUSIVE' : mode = FileLock.BLOCKING_EXCLUSIVE;
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
