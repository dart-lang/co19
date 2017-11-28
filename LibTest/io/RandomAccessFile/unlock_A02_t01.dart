/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RandomAccessFile> unlock([int start = 0, int end = -1])
 * Unlocks the file or part of the file.
 *
 * NOTE file locking does have slight differences in behavior across platforms:
 *
 * See lock for more details.
 *
 * @description Checks that on Windows the regions used for lock and unlock
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
  File file = getTempFileSync();
  var rf1 = file.openSync(mode: FileMode.WRITE);
  rf1.writeFromSync(new List.filled(10, 0));
  asyncStart();

  rf1.lockSync(FileLock.EXCLUSIVE, 4, 7);

  var tests = [
    () => checkLocked(rf1.path, 4, 7),
    () => checkUnlocked(rf1.path, 0, 4),
    () => checkUnlocked(rf1.path, 7, 10),
  ];

  Future.forEach(tests, (f) => f()).whenComplete(() {
    var rf1Unlock;
    if (!Platform.isWindows) {
      rf1Unlock = rf1.unlock(0, 10);
    } else {
      rf1Unlock = rf1.unlock(4, 7);
    }
    rf1Unlock.then((RandomAccessFile f) {
      var tests = [
        () => checkUnlocked(rf1.path, 0, 10)
      ];
      Future.forEach(tests, (f) => f()).whenComplete(() {
        rf1.closeSync();
        file.deleteSync();
        asyncEnd();
      });
    });
  });
}
