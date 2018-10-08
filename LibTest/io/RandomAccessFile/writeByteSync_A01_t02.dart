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
 * @description Checks that method writeByteSync throws a FileSystemException if
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
    Expect.equals(0, file.lengthSync());
    var n = rf.writeByteSync(0);
    Expect.isTrue(n is int);
    Expect.equals(1, n);
    Expect.equals(1, rf.lengthSync());
    rf.closeSync();
    try {
      n = rf.writeByteSync(1);
      Expect.fail("should not be here.");
    } on Exception catch (e) {
      Expect.isTrue(e is FileSystemException);
    }
    asyncEnd();
  }).whenComplete(() {
    file.deleteSync();
  });
}
