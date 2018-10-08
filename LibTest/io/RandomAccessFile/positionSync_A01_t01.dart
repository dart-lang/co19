/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int positionSync()
 * Synchronously gets the current byte position in the file.
 * Throws a FileSystemException if the operation fails.
 *
 * @description Checks that method positionSync returns the current byte
 * position in the file.
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
    var rfPos = rf.positionSync();
    Expect.isTrue(rfPos is int);
    Expect.isTrue(rfPos == 10);
    rf.setPositionSync(3);
    rfPos = rf.positionSync();
    Expect.isTrue(rfPos is int);
    Expect.isTrue(rfPos == 3);
    asyncEnd();
    rf.closeSync();
  }).whenComplete(() {
    file.deleteSync();
  });
}
