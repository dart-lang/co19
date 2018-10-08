/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<void> close()
 * Closes the file. Returns a Future that completes when it has been closed.
 *
 * @description Checks that method close returns Future<void> that completes
 * when the file has been closed.
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
    var clf = rf.close();
    Expect.isTrue(clf is Future);
    clf.then((f) {
      try {
        rf.readIntoSync([0, 0]);
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
