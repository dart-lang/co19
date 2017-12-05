/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * void lockSync([
 *     FileLock mode = FileLock.EXCLUSIVE,
 *     int start = 0,
 *     int end = -1
 *     ])
 * Synchronously locks the file or part of the file.
 * . . .
 * If mode is FileLock.EXCLUSIVE or FileLock.SHARED, an exception is thrown if
 * the lock cannot be obtained. If mode is FileLock.BLOCKING_EXCLUSIVE or
 * FileLock.BLOCKING_SHARED, the call returns only after the lock has been
 * obtained.
 *
 * @description Checks that if mode is FileLock.BLOCKING_SHARED, the returned
 * Future is resolved only when the lock has been obtained.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/async_utils.dart";
import "../file_utils.dart";
import "lock_check_3_lib.dart";

void check(int fLen) {
  File file = getTempFileSync();
  asyncStart();
  var rf = file.openSync(mode: FileMode.WRITE);
  rf.writeFromSync(new List.filled(fLen, 1));
  rf.lockSync(FileLock.EXCLUSIVE);
  var tests = [() => checkUnlocked(rf.path, 0, -1, FileLock.BLOCKING_SHARED)];
  Future.forEach(tests, (f) => f()).whenComplete(() {
    asyncEnd();
    rf.unlockSync();
    rf.closeSync();
    file.deleteSync();
  });
  rf.unlockSync();
}

main() {
  check(10);
  check(1000);
}
