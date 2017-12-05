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
 * If mode is FileLock.EXCLUSIVE or FileLock.SHARED, an error is signaled if the
 * lock cannot be obtained. If mode is FileLock.BLOCKING_EXCLUSIVE or
 * FileLock.BLOCKING_SHARED, the returned Future is resolved only when the lock
 * has been obtained.
 *
 * @description Checks that if mode is FileLock.BLOCKING_EXCLUSIVE, the returned
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
  var rfLock = rf.lock(FileLock.EXCLUSIVE);
  rfLock.then((RandomAccessFile f) {
    var tests = [
      () => checkUnlocked(f.path, 0, -1, FileLock.BLOCKING_EXCLUSIVE)
    ];
    Future.forEach(tests, (f) => f()).whenComplete(() {
      asyncEnd();
      rf.unlockSync();
      rf.closeSync();
      file.deleteSync();
    });
  }).whenComplete(() {
    rf.unlockSync();
  });
}

main() {
  check(10);
  check(1000);
}
