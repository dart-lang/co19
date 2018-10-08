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
 * @description Checks that if a file is open for reading an exclusive lock
 * cannot be set.
 * @author ngl@unipro.ru
 * @issue 31557
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";
import "lock_check_2_lib.dart";

main() {
  int fLen = 10;
  File file = getTempFileSync();
  file.writeAsBytesSync(new List.filled(fLen, 1));
  var rf = file.openSync(mode: FileMode.read);
  asyncStart();
  var tests = [
        () => checkLock(rf.path, 0, fLen, FileLock.exclusive, locked: false)
  ];
  Future.forEach(tests, (f) => f()).whenComplete(() {
    asyncEnd();
    rf.closeSync();
    file.deleteSync();
  });
}
