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
/// Locks the byte range from start to end of the file, with the byte at position
/// end not included. If no arguments are specified, the full file is locked, If
/// only start is specified the file is locked from byte position start to the
/// end of the file, no matter how large it grows. It is possible to specify an
/// explicit value of end which is past the current length of the file.
///
/// @description Checks that if no arguments are specified, the full file is
/// locked.
/// @author ngl@unipro.ru

import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";
import "lock_check_1_lib.dart";

void check(int fLen) {
  File file = getTempFileSync();
  asyncStart();
  var rf = file.openSync(mode: FileMode.write);
  rf.writeFromSync(new List.filled(fLen, 1));
  rf.lockSync(FileLock.exclusive);
  String eScript = Platform.script.toString();
  var tests = [
    () => checkLocked(eScript, rf.path),
    () => checkLocked(eScript, rf.path, fLen, fLen + 10)
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
  check(100);
  check(1000);
}

main(List<String> args) {
  if(args.length > 0)
    runProcess(args);
  else {
    runMain();
  }
}
