// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<RandomAccessFile> unlock([int start = 0, int end = -1])
/// Unlocks the file or part of the file.
///
/// NOTE file locking does have slight differences in behavior across platforms:
///
/// See lock for more details.
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
  File file = getTempFileSync();
  var rf1 = file.openSync(mode: FileMode.write);
  rf1.writeFromSync(new List.filled(10, 0));
  asyncStart();
  rf1.lockSync(FileLock.exclusive, 4, 7);
  String eScript = Platform.script.toString();
  var tests = [
    () => checkLocked(eScript, rf1.path, 4, 7),
    () => checkUnlocked(eScript, rf1.path, 0, 4),
    () => checkUnlocked(eScript, rf1.path, 7, 10),
  ];
  Future.forEach(tests, (Function f) => f()).whenComplete(() {
    var rf1Unlock;
    if (!Platform.isWindows) {
      rf1Unlock = rf1.unlock(0, 10);
    } else {
      rf1Unlock = rf1.unlock(4, 7);
    }
    rf1Unlock.then((RandomAccessFile f) {
      var tests = [
        () => checkUnlocked(eScript, rf1.path, 0, 10)
      ];
      Future.forEach(tests, (Function f) => f()).whenComplete(() {
        asyncEnd();
        rf1.closeSync();
        file.deleteSync();
      });
    });
  });
}

main(List<String> args) {
  if(args.length > 0)
    runProcess(args);
  else {
    runMain();
  }
}
