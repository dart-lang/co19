/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RandomAccessFile> unlock([int start = 0, int end = -1])
 * Unlocks the file or part of the file.
 *
 * Unlocks the byte range from start to end of the file, with the byte at
 * position end not included. If no arguments are specified, the full file is
 * unlocked, If only start is specified the file is unlocked from byte position
 * start to the end of the file.
 *
 * @description Checks that method unlock returns Future<RandomAccessFile> that
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
  rf.lockSync(lock);
  var rfUnlock = rf.unlock();
  Expect.isTrue(rfUnlock is Future<RandomAccessFile>);
  rfUnlock.then((RandomAccessFile f) {
      Expect.isTrue(rf is RandomAccessFile);
      Expect.isTrue(rf == f);
    }).whenComplete(() {
    asyncEnd();
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
