// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// void lockSync([
///     FileLock mode = FileLock.exclusive,
///     int start = 0,
///     int end = -1
///     ])
/// Synchronously locks the file or part of the file.
/// . . .
/// If mode is FileLock.exclusive or FileLock.shared, an exception is thrown if
/// the lock cannot be obtained. If mode is FileLock.blockingExclusive or
/// FileLock.blockingShared, the call returns only after the lock has been
/// obtained.
///
/// @description Checks that if mode is FileLock.shared, an exception is thrown
/// if the lock cannot be obtained.
/// @author ngl@unipro.ru

import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";
import "lock_check_3_lib.dart";

void check(int fLen) {
  File file = getTempFileSync();
  asyncStart();
  var rf = file.openSync(mode: FileMode.write);
  rf.writeFromSync(new List.filled(fLen, 1));
  rf.lockSync(FileLock.exclusive);
  var tests = [
    () =>
        checkLocked(Platform.script.toString(), rf.path, 0, -1, FileLock.shared)
  ];
  Future.forEach(tests, (Function f) => f()).whenComplete(() {
    asyncEnd();
    rf.unlockSync();
    rf.closeSync();
    try {
      file.deleteSync();
    } catch (_) {}
  });
}

runMain() {
  check(10);
  check(1000);
}

main(List<String> args) {
  if (args.length > 0)
    runProcess(args);
  else {
    runMain();
  }
}
