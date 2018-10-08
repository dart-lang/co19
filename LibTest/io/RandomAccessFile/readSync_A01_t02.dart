/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> readSync(int bytes)
 * Synchronously reads a maximum of bytes bytes from a file and returns the
 * result in a list of bytes.
 *
 * Throws a FileSystemException if the operation fails.
 *
 * @description Checks that method readSync throws a FileSystemException if the
 * operation fails.
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
    rf.setPositionSync(1);
    var list1 = rf.readSync(5);
    Expect.isTrue(list1 is List<int>);
    int len = list1.length;
    Expect.equals(5, len);
    for (int i = 0; i < len; i++) {
      Expect.isTrue(list1[i] == (i + 2) & 0xff);
    }
    rf.closeSync();
    try {
      rf.readSync(5);
      Expect.fail("should not be here.");
    } on Exception catch (e) {
      Expect.isTrue(e is FileSystemException);
    }
    asyncEnd();
  }).whenComplete(() {
    file.deleteSync();
  });
}
