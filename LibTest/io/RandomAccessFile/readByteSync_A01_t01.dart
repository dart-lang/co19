/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int readByteSync()
 * Synchronously reads a single byte from the file. If end-of-file has been
 * reached -1 is returned.
 *
 * Throws a FileSystemException if the operation fails.
 *
 * @description Checks that method readByteSync returns int which is a single
 * byte read from the file. And if end-of-file has been reached -1 is
 * returned.
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
    var byte;
    rf.setPositionSync(0);
    for (int i = 0; i < 10; i++) {
      byte = rf.readByteSync();
      Expect.isTrue(byte is int);
      Expect.equals((i + 1) & 0xff, byte);
    }
    byte = rf.readByteSync();
    Expect.isTrue(byte is int);
    Expect.equals(-1, byte);
    asyncEnd();
    rf.closeSync();
  }).whenComplete(() {
    file.deleteSync();
  });
}
