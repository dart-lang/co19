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
 * @description Checks that if only start is specified the file is unlocked from
 * byte position start to the end of the file.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";
import "lock_check_1_lib.dart";

main() {
  if (Platform.isWindows) {
    return;
  }
  File file = getTempFileSync();
  var rf = file.openSync(mode: FileMode.write);
  rf.writeFromSync(new List.filled(30, 0));
  asyncStart();
  rf.lockSync(FileLock.exclusive, 12);
  var tests = [
    () => checkUnlocked(rf.path, 0, 12),
    () => checkLocked(rf.path, 12, 30),
    () => checkLocked(rf.path, 30, 40)
  ];
  Future.forEach(tests, (f) => f()).whenComplete(() {
    var rf1Unlock = rf.unlock(15);
    rf1Unlock.then((RandomAccessFile f) {
      var tests = [
        () => checkUnlocked(rf.path, 0, 12),
        () => checkLocked(rf.path, 12, 15),
        () => checkUnlocked(rf.path, 15, 50)
      ];
      Future.forEach(tests, (f) => f()).whenComplete(() {
        asyncEnd();
        rf.unlockSync();
        rf.closeSync();
        file.deleteSync();
      });
    });
  });
}
