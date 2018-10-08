/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int writeByteSync(int value)
 * Synchronously writes a single byte to the file. Returns the number of bytes
 * successfully written.
 *
 * Throws a FileSystemException if the operation fails.
 *
 * @description Checks that method writeByteSync synchronously writes a single
 * byte to the file and returns the number of bytes successfully written.
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
    Expect.equals(0, file.lengthSync());
    List<int> list = new List<int>(10);
    var n = rf.writeByteSync(0);
    Expect.isTrue(n is int);
    Expect.equals(1, n);
    Expect.equals(1, rf.lengthSync());
    for (int i = 1; i < 10; i++) {
      n = rf.writeByteSync(i);
      Expect.equals(1, n);
      Expect.equals(i + 1, rf.lengthSync());
    }
    rf.setPositionSync(0);
    rf.readIntoSync(list);
    Expect.listEquals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], list);
    asyncEnd();
    rf.closeSync();
  }).whenComplete(() {
    file.deleteSync();
  });
}
