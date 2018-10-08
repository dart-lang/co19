/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<RandomAccessFile> lock([
 *     FileLock mode = FileLock.exclusive,
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
import "../file_utils.dart";
import "lock_check_1_lib.dart";

main() {
  File file = getTempFileSync();
  file.writeAsBytesSync(new List.filled(6, 0));
  var rf = file.openSync(mode: FileMode.write);
  asyncStart();
  var rfLock = rf.lock(FileLock.shared, 2, 5);
  rfLock.then((RandomAccessFile f) {
    var tests = [
      () => checkUnlocked(f.path, 0, 1, FileLock.shared),
      () => checkUnlocked(f.path, 1, 2, FileLock.shared),
      () => checkLocked(f.path, 2, 3),
      () => checkLocked(f.path, 3, 4),
      () => checkLocked(f.path, 4, 5),
      () => checkUnlocked(f.path, 2, 3, FileLock.shared),
      () => checkUnlocked(f.path, 3, 4, FileLock.shared),
      () => checkUnlocked(f.path, 4, 5, FileLock.shared),
      () => checkUnlocked(f.path, 5, 6, FileLock.shared)
    ];
    Future.forEach(tests, (f) => f()).whenComplete(() {
      asyncEnd();
      if (Platform.isWindows) {
        rf.unlockSync(2, 5);
      } else {
        rf.unlockSync();
      }
      rf.closeSync();
      file.deleteSync();
    });
  });
}
