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
 * @description Checks that method truncate does not change the file length if
 * length is equal to the file length.
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
    var len1 = rf.lengthSync();
    var f1 = rf.truncate(10);
    f1.then((RandomAccessFile f) {
      var len2 = f.lengthSync();
      Expect.isTrue(len2 == 10);
      Expect.isTrue(len2 == len1);
      asyncEnd();
    }).whenComplete(() {
      rf.closeSync();
      file.deleteSync();
    });
  });
}
