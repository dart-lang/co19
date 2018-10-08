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
 * @description Checks that method lock returns Future<RandomAccessFile> that
 * completes with this RandomAccessFile.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

check(FileLock lock) {
  File file = getTempFileSync();
  var rf = file.openSync(mode: FileMode.write);
  file.writeAsBytesSync(new List.filled(10, 0));
  asyncStart();
  var rfLock = rf.lock(lock);
  Expect.isTrue(rfLock is Future<RandomAccessFile>);
  rfLock.then((RandomAccessFile f) {
    Expect.isTrue(f == rf);
    asyncEnd();
  }).whenComplete(() {
    rf.unlockSync();
    rf.closeSync();
    file.deleteSync();
  });
}

main() {
  check(FileLock.shared);
  check(FileLock.exclusive);
  check(FileLock.blockingShared);
  check(FileLock.blockingExclusive);
}
