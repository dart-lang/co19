/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<RandomAccessFile> lock([
 *     FileLock mode = FileLock.EXCLUSIVE,
 *     int start = 0,
 *     int end = -1
 * ])
 * Locks the file or part of the file.
 *
 * By default an exclusive lock will be obtained, but that can be overridden by
 * the mode argument.
 *
 * @description Checks that method lock may lock in a SHARED mode when mode
 * argument is overridden.
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
  file.writeAsBytesSync(new List.filled(6, 0));

  var rf = file.openSync(mode: FileMode.WRITE);
  asyncStart();

  var rfLock = rf.lock(FileLock.SHARED, 2, 5);
  rfLock.then((RandomAccessFile f) {
    var tests = [
      () => checkUnlocked(f.path, 0, 1, FileLock.SHARED),
      () => checkUnlocked(f.path, 1, 2, FileLock.SHARED),
      () => checkLocked(f.path, 2, 3),
      () => checkLocked(f.path, 3, 4),
      () => checkLocked(f.path, 4, 5),
      () => checkUnlocked(f.path, 2, 3, FileLock.SHARED),
      () => checkUnlocked(f.path, 3, 4, FileLock.SHARED),
      () => checkUnlocked(f.path, 4, 5, FileLock.SHARED),
      () => checkUnlocked(f.path, 5, 6, FileLock.SHARED)
    ];

    Future.forEach(tests, (f) => f()).whenComplete(() {
      rf.unlockSync();
      rf.closeSync();
      file.deleteSync();
      asyncEnd();
    });
  });
}
