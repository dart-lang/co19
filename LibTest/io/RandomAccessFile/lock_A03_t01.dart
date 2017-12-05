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
 * To obtain an exclusive lock on a file it must be opened for writing.
 *
 * @description Checks that to obtain an exclusive lock on a file it must be
 * opened for writing.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/async_utils.dart";
import "../file_utils.dart";
import "lock_check_1_lib.dart";

void check(int fLen) {
  File file = getTempFileSync();
  var rf = file.openSync(mode: FileMode.WRITE);
  rf.writeFromSync(new List.filled(fLen, 1));
  asyncStart();
  var rfLock = rf.lock(FileLock.EXCLUSIVE);
  rfLock.then((RandomAccessFile f) {
    var tests = [() => checkLocked(f.path, 0, fLen, FileLock.EXCLUSIVE)];
    Future.forEach(tests, (f) => f()).whenComplete(() {
      asyncEnd();
      rf.unlockSync();
      rf.closeSync();
      file.deleteSync();
    });
  });
}

main() {
  check(10);
  check(1000);
}
