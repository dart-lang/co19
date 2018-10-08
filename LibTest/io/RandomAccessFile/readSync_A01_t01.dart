/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> readSync(int bytes)
 * Synchronously reads a maximum of bytes bytes from a file and returns the
 * result in a list of bytes.
 *
 * Throws a FileSystemException if the operation fails.
 *
 * @description Checks that method readSync returns List<int> which contains
 * a maximum of bytes bytes from a file.
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
    rf.setPositionSync(1);
    var list1 = rf.readSync(num);
    Expect.isTrue(list1 is List<int>);
    int len = list1.length;
    Expect.equals(num, len);
    for (int i = 0; i < len; i++) {
      Expect.isTrue(list1[i] == (i + 2) & 0xff);
    }
    var list2 = rf.readSync(10 - num);
    Expect.isTrue(list1 is List<int>);
    len = list2.length;
    Expect.equals(9 - num, len);
    for (int i = 0; i < len; i++) {
      Expect.isTrue(list2[i] == (i + num + 2) & 0xff);
    }
    asyncEnd();
    rf.closeSync();
  }).whenComplete(() {
    file.deleteSync();
  });
}

main() {
  for (int i = 0; i < 10; i++) {
    check(i);
  }
}
