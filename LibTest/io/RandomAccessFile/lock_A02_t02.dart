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
 * . . .
 * Locks the byte range from start to end of the file, with the byte at position
 * end not included. If no arguments are specified, the full file is locked, If
 * only start is specified the file is locked from byte position start to the
 * end of the file, no matter how large it grows. It is possible to specify an
 * explicit value of end which is past the current length of the file.
 *
 * @description Checks that if only start is specified the file is locked from
 * byte position start to the end of the file, no matter how large it grows.
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
  var start = fLen >> 1;
  asyncStart();
  var rfLock = rf.lock(FileLock.exclusive, start);
  rfLock.then((RandomAccessFile f) {
    rf.writeFromSync([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
    var rfLen = f.lengthSync();
    Expect.equals(fLen + 10, rfLen);
    var tests = [
      () => checkLocked(f.path, start, rfLen),
      () => checkUnlocked(f.path, 0, start),
      () => checkLocked(f.path, rfLen + 1)
    ];
    Future.forEach(tests, (f) => f()).whenComplete(() {
      asyncEnd();
      if (Platform.isWindows) {
        rf.unlockSync(start);
      } else {
        rf.unlockSync();
      }
      rf.closeSync();
      file.deleteSync();
    });
  });
}

main() {
  check(10);
  check(1000);
}
