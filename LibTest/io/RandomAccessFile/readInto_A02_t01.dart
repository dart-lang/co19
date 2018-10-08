/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<int> readInto(List<int> buffer, [int start = 0, int end])
 * . . .
 * Returns a Future<int> that completes with the number of bytes read.
 *
 * @description Checks that method readInto returns Future<int> that completes
 * with the number of bytes read.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

check(int number) {
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.write);
  raFile.then((RandomAccessFile rf) {
    Expect.isNotNull(rf);
    for (int i = 0; i < 10; i++) {
      rf.writeByteSync((i + 1) & 0xff);
    }
    List<int> list = new List<int>(20);
    rf.setPositionSync(0);
    var num = rf.readInto(list, 0, number);
    Expect.isTrue(num is Future<int>);
    num.then((int n) {
      Expect.isTrue(n is int);
      Expect.equals(number, n);
      asyncEnd();
    }).whenComplete(() {
      rf.closeSync();
      file.deleteSync();
    });
  });
}

main() {
  for (int i = 0; i <= 10; i++) {
    check(i);
  }
}
