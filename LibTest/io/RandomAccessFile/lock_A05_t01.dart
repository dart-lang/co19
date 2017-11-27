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
 * . . .
 * NOTE file locking does have slight differences in behavior across platforms:
 *
 * On Linux and OS X this uses advisory locks, which have the surprising
 * semantics that all locks associated with a given file are removed when any
 * file descriptor for that file is closed by the process. Note that this does
 * not actually lock the file for access. Also note that advisory locks are on
 * a process level. This means that several isolates in the same process can
 * obtain an exclusive lock on the same file.
 *
 * On Windows the regions used for lock and unlock needs to match. If that is
 * not the case unlocking will result in the OS error "The segment is already
 * unlocked".

 *
 * @description Checks that On Windows the regions used for lock and unlock
 * needs to match.
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
  int fLen = 10;
  File file = getTempFileSync();
  asyncStart();
  var rf1 = file.openSync(mode: FileMode.WRITE);
  var rf2 = file.openSync(mode: FileMode.WRITE);
  for (int i = 0; i < fLen; i++) {
    rf1.writeByteSync((i + 1) & 0xff);
  }

  var rfLock = rf1.lock(FileLock.EXCLUSIVE, 4, 6);
  rf2.lock(FileLock.EXCLUSIVE, 7, 8);

  rfLock.then((RandomAccessFile f) {
    var tests = [
      () => checkLocked(f.path, 4),
      () => checkUnlocked(f.path, 0, 4),
      () => checkUnlocked(f.path, 6, 7),
      () => checkUnlocked(f.path, 8),
      () => checkLocked(f.path, 7),
      () => rf1.unlock(7, 8)
    ];

    if (Platform.isWindows) {
      tests
          .addAll([() => rf1.unlockSync(4, 4), () => checkUnlocked(file.path)]);
    } else {
      tests.addAll([
        () => rf1.unlockSync(4, 5),
        () => checkUnlocked(file.path, 0, 5),
        () => checkLocked(file.path, 5),
        () => checkUnlocked(file.path, 6),
        () => rf2.unlockSync(5, 6),
        () => checkUnlocked(file.path)
      ]);
    }

    Future.forEach(tests, (f) => f()).whenComplete(() {
      rf1.closeSync();
      rf2.closeSync();
      file.deleteSync();
      asyncEnd();
    });
  });
}
