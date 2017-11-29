/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void unlockSync([int start = 0, int end = -1])
 * Synchronously unlocks the file or part of the file.
 *
 * Unlocks the byte range from start to end of the file, with the byte at
 * position end not included. If no arguments are specified, the full file is
 * unlocked, If only start is specified the file is unlocked from byte position
 * start to the end of the file.
 *
 * @description Checks that method unlockSync synchronously unlocks the byte
 * range from start to end of the file, with the byte at position end not
 * included.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../file_utils.dart";

// Check whether the file is locked or not.
checkLock(String path, int start, int end, FileLock mode, {bool locked}) {
  // Client process returns either 'LOCK FAILED' or 'LOCK SUCCEEDED'.
  var expected = locked ? 'LOCK FAILED' : 'LOCK SUCCEEDED';
  var arguments = []
    ..addAll(Platform.executableArguments)
    ..add(Platform.script.resolve('lock_A01_t01_lib.dart').toFilePath())
    ..add(path)
    ..add(mode == FileLock.EXCLUSIVE ? 'EXCLUSIVE' : 'SHARED')
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

main() {
  File file = getTempFileSync();
  var rf1 = file.openSync(mode: FileMode.WRITE);
  var rf2 = file.openSync(mode: FileMode.WRITE);
  rf1.writeFromSync(new List.filled(30, 0));
  asyncStart();

  rf1.lockSync(FileLock.EXCLUSIVE, 10, 15);
  rf2.lockSync(FileLock.EXCLUSIVE, 20, 25);

  var tests = [
    () => checkLocked(rf1.path, 10, 15),
    () => checkLocked(rf1.path, 20, 25),
    () => checkUnlocked(rf1.path, 0, 10),
    () => checkUnlocked(rf1.path, 15, 20),
    () => checkUnlocked(rf1.path, 25, 30)
  ];

  Future.forEach(tests, (f) => f()).whenComplete(() {
    rf1.unlockSync(10, 15);
    var tests = [
      () => checkUnlocked(rf1.path, 10, 15),
      () => checkLocked(rf1.path, 20, 25),
      () => checkUnlocked(rf1.path, 0, 20),
      () => checkUnlocked(rf1.path, 25, 30)
    ];

    Future.forEach(tests, (f) => f()).whenComplete(() {
      rf2.unlockSync();
      rf1.closeSync();
      rf2.closeSync();
      file.deleteSync();
      asyncEnd();
    });
  });
}
