/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void unlockSync([int start = 0, int end = -1])
 * Synchronously unlocks the file or part of the file.
 *
 * Unlocks the byte range from start to end of the file, with the byte at
 * position end not included. If no arguments are specified, the full file is
 * unlocked, If only start is specified the file is unlocked from byte position
 * start to the end of the file.
 *
 * @description Checks that method unlockSync synchronously unlocks the byte
 * range from start to end of the file, with the byte at position end not
 * included.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";
import "lock_check_1_lib.dart";

main() {
  File file = getTempFileSync();
  var rf1 = file.openSync(mode: FileMode.write);
  var rf2 = file.openSync(mode: FileMode.write);
  rf1.writeFromSync(new List.filled(30, 0));
  asyncStart();
  rf1.lockSync(FileLock.exclusive, 10, 15);
  rf2.lockSync(FileLock.exclusive, 20, 25);
  var tests = [
    () => checkLocked(rf1.path, 10, 15),
    () => checkLocked(rf1.path, 20, 25),
    () => checkUnlocked(rf1.path, 0, 10),
    () => checkUnlocked(rf1.path, 15, 20),
    () => checkUnlocked(rf1.path, 25, 30)
  ];
  Future.forEach(tests, (f) => f()).whenComplete(() {
    rf1.unlockSync(10, 15);
    var tests = [
      () => checkUnlocked(rf1.path, 10, 15),
      () => checkLocked(rf1.path, 20, 25),
      () => checkUnlocked(rf1.path, 0, 20),
      () => checkUnlocked(rf1.path, 25, 30)
    ];
    Future.forEach(tests, (f) => f()).whenComplete(() {
      asyncEnd();
      if (Platform.isWindows) {
        rf2.unlockSync(20, 25);
      } else {
        rf2.unlockSync();
      }
      rf1.closeSync();
      rf2.closeSync();
      file.deleteSync();
    });
  });
}
