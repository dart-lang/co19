/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int lengthSync()
 * Synchronously gets the length of the file.
 * Throws a FileSystemException if the operation fails.
 *
 * @description Checks that method lengthSync throws a FileSystemException if
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
    rf.writeByteSync(9);
    var rfLen = rf.lengthSync();
    Expect.isTrue(rfLen == 1);

    rf.closeSync();
    try {
      rf.lengthSync();
      Expect.fail('should not be here');
    } on Exception catch (e) {
      Expect.isTrue(e is FileSystemException);
    }
    asyncEnd();
  }).whenComplete(() {
    file.deleteSync();
  });
}
