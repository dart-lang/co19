/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void truncateSync(int length)
 * Synchronously truncates (or extends) the file to length bytes.
 *
 * @description Checks that method truncateSync synchronously truncates the file
 * to length bytes if length is smaller then the file length.
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
    rf.truncateSync(6);
    var len2 = rf.lengthSync();
    Expect.isTrue(len2 == 6);
    Expect.isTrue(len2 < len1);
    asyncEnd();
    rf.closeSync();
  }).whenComplete(() {
    file.deleteSync();
  });
}
