/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RandomAccessFile> close()
 * Closes the file. Returns a Future<RandomAccessFile> that completes with this
 * RandomAccessFile when it has been closed.
 *
 * @description Checks that method close returns Future<RandomAccessFile> that
 * completes with this RandomAccessFile.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.READ);
  raFile.then((RandomAccessFile rf) {
    Expect.isNotNull(rf);
    var clf = rf.close();
    Expect.isTrue(clf is Future<RandomAccessFile>);
    clf.then((RandomAccessFile f) {
      Expect.isTrue(f == rf);
      asyncEnd();
    }).whenComplete(() {
      file.delete();
    });
  });
}
