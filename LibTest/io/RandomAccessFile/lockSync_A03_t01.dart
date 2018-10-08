/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * void lockSync([
 *     FileLock mode = FileLock.exclusive,
 *     int start = 0,
 *     int end = -1
 *     ])
 * Synchronously locks the file or part of the file.
 * . . .
 * To obtain an exclusive lock on a file it must be opened for writing.
 *
 * @description Checks that to obtain an exclusive lock on a file it must be
 * opened for writing.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";
import "lock_check_1_lib.dart";

void check(int fLen) {
  File file = getTempFileSync();
  var rf = file.openSync(mode: FileMode.write);
  rf.writeFromSync(new List.filled(fLen, 1));
  asyncStart();
  rf.lockSync(FileLock.exclusive);
  var tests = [() => checkLocked(rf.path, 0, fLen, FileLock.exclusive)];
  Future.forEach(tests, (f) => f()).whenComplete(() {
    asyncEnd();
    rf.unlockSync();
    rf.closeSync();
    file.deleteSync();
  });
}

main() {
  check(10);
  check(1000);
}
