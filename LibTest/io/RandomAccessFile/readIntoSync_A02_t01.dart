/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int readIntoSync(List<int> buffer, [int start = 0, int end])
 * . . .
 * Throws a FileSystemException if the operation fails.
 *
 * @description Checks that method readIntoSync throws a FileSystemException if
 * the operation fails.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.write);
  raFile.then((RandomAccessFile rf) {
    Expect.isNotNull(rf);
    for (int i = 0; i < 10; i++) {
      rf.writeByteSync((i + 1) & 0xff);
    }
    List<int> list = new List<int>(20);
    rf.setPositionSync(0);
    var num = rf.readIntoSync(list, 0);
    Expect.isTrue(num is int);
    Expect.equals(10, num);
    rf.closeSync();
    try {
      rf.readIntoSync(list, 0);
      Expect.fail("should not be here.");
    } on Exception catch (e) {
      Expect.isTrue(e is FileSystemException);
    }
    asyncEnd();
  }).whenComplete(() {
    file.deleteSync();
  });
}
