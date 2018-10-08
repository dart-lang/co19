/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<void> close()
 * Closes the file. Returns a Future that completes when it has been closed.
 *
 * @description Checks that method close() returns Future<void> that completes
 * when the file has been closed, and getting length synchronously of this
 * closed file throws FileSystemException.
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
    rf.close().then((_) {
      try {
        rf.lengthSync();
        Expect.fail('should not be here');
      } on Exception catch (e) {
        Expect.isTrue(e is FileSystemException);
      }
      asyncEnd();
    }).whenComplete(() {
      file.delete();
    });
  });
}
