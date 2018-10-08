/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List<int>> read(int bytes)
 * Reads bytes bytes from a file and returns the result as a list of bytes.
 *
 * @description Checks that method read returns Future<List<int>> that completes
 * with the List<int> which contains bytes bytes from a file.
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
    rf.setPositionSync(0);
    var list1 = rf.read(num);
    Expect.isTrue(list1 is Future<List<int>>);

    list1.then((List<int> list) {
      Expect.isTrue(list is List<int>);
      int len = list.length;
      Expect.equals(num, len);
      for (int i = 0; i < len; i++) {
        Expect.isTrue(list[i] == (i + 1) & 0xff);
      }
    }).whenComplete(() {
      var list2 = rf.read(11 - num);
      Expect.isTrue(list2 is Future<List<int>>);
      list2.then((List<int> list) {
        Expect.isTrue(list is List<int>);
        int len = list.length;
        Expect.equals(10 - num, len);
        for (int i = 0; i < len; i++) {
          Expect.isTrue(list[i] == (i + num + 1) & 0xff);
        }
        asyncEnd();
      }).whenComplete(() {
        rf.closeSync();
        file.deleteSync();
      });
    });
  });
}

main() {
  for (int i = 0; i < 10; i++) {
    check(i);
  }
}
