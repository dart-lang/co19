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
 * @description Checks that if a file is open for reading an exclusive lock
 * cannot be set.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/async_utils.dart";
import "../file_utils.dart";
import "lock_check_2_lib.dart";

main() {
  int fLen = 10;
  File file = getTempFileSync();
  file.writeAsBytesSync(new List.filled(fLen, 1));
  var rf = file.openSync(mode: FileMode.READ);
  asyncStart();
  var tests = [
    () => checkLock(rf.path, 0, fLen, FileLock.EXCLUSIVE, locked: false)
  ];
  Future.forEach(tests, (f) => f()).whenComplete(() {
    asyncEnd();
    rf.closeSync();
    file.deleteSync();
  });
}
