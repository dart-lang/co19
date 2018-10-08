/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<int> length()
 * Gets the length of the file. Returns a Future<int> that completes with the
 * length in bytes.
 *
 * @description Checks that method length returns Future<int> that completes
 * with the length in bytes.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

void check(int fLen) {
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.write);
  raFile.then((RandomAccessFile rf) {
    Expect.isNotNull(rf);
    for (int i = 0; i < fLen; i++) {
      rf.writeByteSync((i + 1) & 0xff);
    };
    rf.length().then((int len) {
      Expect.equals(fLen, len);
      asyncEnd();
    }).whenComplete(() {
      rf.closeSync();
      file.deleteSync();
    });
  });
}

main() {
  for (int i = 0; i < 10; i++) {
    check(i);
  }
}
