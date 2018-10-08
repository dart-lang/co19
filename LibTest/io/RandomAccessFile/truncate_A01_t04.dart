/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RandomAccessFile> truncate(int length)
 * Truncates (or extends) the file to length bytes. Returns a
 * Future<RandomAccessFile> that completes with this RandomAccessFile when the
 * truncation has been performed.
 *
 * @description Checks that method truncate returns a Future<RandomAccessFile>
 * that completes with this RandomAccessFile when the truncation has been
 * performed.
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
    var f1 = rf.truncate(10);
    Expect.isTrue(f1 is Future<RandomAccessFile>);
    f1.then((RandomAccessFile f) {
      Expect.isTrue(f is RandomAccessFile);
      Expect.isTrue(f == rf);
      asyncEnd();
    }).whenComplete(() {
      rf.closeSync();
      file.deleteSync();
    });
  });
}
