/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<int> readByte()
 * Reads a byte from the file. Returns a Future<int> that completes with the
 * byte, or with -1 if end-of-file has been reached.
 *
 * @description Checks that method readByte returns Future<int> that completes
 * with the byte.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

void check(int num) {
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.write);
  raFile.then((RandomAccessFile rf) {
    Expect.isNotNull(rf);
    for (int i = 0; i < 10; i++) {
      rf.writeByteSync((i + 1) & 0xff);
    }
    rf.setPositionSync(num);
    var byte = rf.readByte();
    Expect.isTrue(byte is Future<int>);
    byte.then((int b) {
      Expect.isTrue(b is int);
      Expect.equals((num + 1) & 0xff, b);
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
