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
/// NOTE file locking does have slight differences in behavior across platforms:
///
/// On Linux and OS X this uses advisory locks, which have the surprising
/// semantics that all locks associated with a given file are removed when any
/// file descriptor for that file is closed by the process. Note that this does
/// not actually lock the file for access. Also note that advisory locks are on
/// a process level. This means that several isolates in the same process can
/// obtain an exclusive lock on the same file.
///
/// On Windows the regions used for lock and unlock needs to match. If that is
/// not the case unlocking will result in the OS error "The segment is already
/// unlocked".
///
/// @description Checks that on Windows the regions used for lock and unlock
/// needs to match.
/// @author ngl@unipro.ru

import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";
import "lock_check_1_lib.dart";

runMain() {
  int fLen = 10;
  File file = getTempFileSync();
  asyncStart();
  var rf1 = file.openSync(mode: FileMode.write);
  var rf2 = file.openSync(mode: FileMode.write);
  for (int i = 0; i < fLen; i++) {
    rf1.writeByteSync((i + 1) & 0xff);
  }
  rf1.lockSync(FileLock.exclusive, 4, 6);
  rf2.lockSync(FileLock.exclusive, 7, 8);
  String eScript = Platform.script.toString();
  var tests = [
    () => checkLocked(eScript, rf1.path, 4),
    () => checkUnlocked(eScript, rf1.path, 0, 4),
    () => checkUnlocked(eScript, rf1.path, 6, 7),
    () => checkUnlocked(eScript, rf2.path, 8),
    () => checkLocked(eScript, rf2.path, 7)
  ];
  if (Platform.isWindows) {
    tests.addAll([
          () => rf1.unlockSync(4, 6),
          () => rf2.unlock(7, 8),
          () => checkUnlocked(eScript, file.path)
    ]);
  } else {
    tests.addAll([
      () => rf1.unlockSync(4, 5),
      () => rf1.unlock(7, 8),
      () => checkUnlocked(eScript, file.path, 0, 5),
      () => checkLocked(eScript, file.path, 5),
      () => checkUnlocked(eScript, file.path, 6),
      () => rf2.unlockSync(5, 6),
      () => checkUnlocked(eScript, file.path)
    ]);
  }
  Future.forEach(tests, (Function f) => f()).whenComplete(() {
    asyncEnd();
    rf1.closeSync();
    rf2.closeSync();
    try {
      file.deleteSync();
    } catch (_) {}
  });
}

main(List<String> args) {
  if(args.length > 0)
    runProcess(args);
  else {
    runMain();
  }
}
