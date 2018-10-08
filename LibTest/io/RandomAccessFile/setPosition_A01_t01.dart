/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RandomAccessFile> setPosition(int position)
 * Sets the byte position in the file. Returns a Future<RandomAccessFile> that
 * completes with this RandomAccessFile when the position has been set.
 *
 * @description Checks that method setPosition returns Future<RandomAccessFile>
 * that completes with this RandomAccessFile when the position has been set.
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
    var raf = rf.setPosition(num);
    Expect.isTrue(raf is Future<RandomAccessFile>);
    raf.then((RandomAccessFile f) {
      Expect.isTrue(f is RandomAccessFile);
      Expect.isTrue(f == rf);
      int byte = f.readByteSync();
      Expect.equals((num + 1) & 0xff, byte);
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
