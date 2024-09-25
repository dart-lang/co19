// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void writeFromSync(List<int> buffer, [int start = 0, int end])
/// Synchronously writes from a List<int> to the file.
/// . . .
///
/// Throws a FileSystemException if the operation fails.
///
/// @description Checks that method writeFromSync throws a FileSystemException
/// if the operation fails.
/// @author ngl@unipro.ru

import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

void check(int start, int end) {
  List<int> list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  int len = end - start;
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.write);
  raFile.then((RandomAccessFile rf) {
    Expect.equals(0, file.lengthSync());
    rf.writeFromSync(list, start, end);
    Expect.equals(len, file.lengthSync());
    rf.closeSync();
    try {
      rf.writeByteSync(1);
      Expect.fail("should not be here.");
    } on Exception catch (e) {
      Expect.isTrue(e is FileSystemException);
    }
    asyncEnd();
  }).whenComplete(() {
    try {
      file.deleteSync();
    } catch (_) {}
  });
}

main() {
  for (int i = 0; i < 10; i++) {
    for (int j = i; j <= 10; j++) {
      check(i, j);
    }
  }
}
