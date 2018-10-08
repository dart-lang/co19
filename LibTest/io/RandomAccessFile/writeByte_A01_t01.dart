/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RandomAccessFile> writeByte(int value)
 * Writes a single byte to the file. Returns a Future<RandomAccessFile> that
 * completes with this RandomAccessFile when the write completes.
 *
 * @description Checks that method writeByte writes a single byte to the file
 * and returns Future<RandomAccessFile> that completes with this
 * RandomAccessFile when the write completes.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

void check(int num, List<int> list) {
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.write);
  raFile.then((RandomAccessFile rf) {
    Expect.equals(0, file.lengthSync());
    var f = rf.writeByte(num);
    Expect.isTrue(f is Future<RandomAccessFile>);

    f.then((RandomAccessFile file) {
      Expect.isTrue(file is RandomAccessFile);
      Expect.equals(rf, file);
      Expect.equals(1, file.lengthSync());
      rf.setPositionSync(0);
      file.readIntoSync(list, num);
      for (int i = 0; i <= num; i++) {
        Expect.isTrue(i == list[i]);
      }
      for (int i = num + 1; i < 10; i++) {
        Expect.isTrue(null == list[i]);
      }
      asyncEnd();
    }).whenComplete(() {
      rf.closeSync();
      file.deleteSync();
    });
  });
}

main() {
  List<int> list = new List<int>(10);
  for (int i = 0; i < 10; i++) {
    check(i, list);
  }
}
