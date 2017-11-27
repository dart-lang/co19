/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<RandomAccessFile> lock([
 *     FileLock mode = FileLock.EXCLUSIVE,
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
 * @description Checks that if no arguments are specified, the full file is
 * locked.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../file_utils.dart";

// Check whether the file is locked or not.
checkLock(String path, int start, int end, FileLock mode, {bool locked}) {
  // Client process returns either 'LOCK FAILED' or 'LOCK SUCCEEDED'.
  var expected = locked ? 'LOCK FAILED' : 'LOCK SUCCEEDED';
  var arguments = []
    ..addAll(Platform.executableArguments)
    ..add(Platform.script.resolve('lock_A01_t01_lib.dart').toFilePath())
    ..add(path)
    ..add(mode == FileLock.EXCLUSIVE ? 'EXCLUSIVE' : 'SHARED')
    ..add('$start')
    ..add('$end');
  return Process
      .run(Platform.executable, arguments)
      .then((ProcessResult result) {
    if (result.exitCode != 0 || !result.stdout.contains(expected)) {
      print("Client failed, exit code ${result.exitCode}");
      print("  stdout:");
      print(result.stdout);
      print("  stderr:");
      print(result.stderr);
      print("  arguments:");
      print(arguments);
      Expect.fail('Client subprocess exit code: ${result.exitCode}');
    }
  });
}

checkLocked(String path,
        [int start = 0, int end = -1, FileLock mode = FileLock.EXCLUSIVE]) =>
    checkLock(path, start, end, mode, locked: true);

void check(int fLen) {
  File file = getTempFileSync();
  file.writeAsBytesSync(new List.filled(fLen, 0));

  var rf = file.openSync(mode: FileMode.WRITE);
  asyncStart();

  var rfLock = rf.lock(FileLock.EXCLUSIVE);

  rfLock.then((RandomAccessFile f) {
    var tests = [
      () => checkLocked(f.path),
    ];

    Future.forEach(tests, (f) => f()).whenComplete(() {
      rf.unlockSync();
      rf.closeSync();
      file.deleteSync();
      asyncEnd();
    });
  });
}

main() {
  check(0);
  check(10);
  check(1000);
}
