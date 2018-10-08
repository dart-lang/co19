/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void closeSync()
 * Synchronously closes the file.
 *
 * Throws a FileSystemException if the operation fails.
 *
 * @description Checks that method closeSync() closes the file and getting
 * length synchronously of closed file throws a FileSystemException.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.read);
  raFile.then((RandomAccessFile rf) {
    Expect.isNotNull(rf);
    rf.closeSync();
    try {
      rf.lengthSync();
    } on Exception catch (e) {
      Expect.isTrue(e is FileSystemException);
    }
    asyncEnd();
  }).whenComplete(() {
    file.deleteSync();
  });
}
