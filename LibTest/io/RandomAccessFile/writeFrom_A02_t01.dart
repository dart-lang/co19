/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<RandomAccessFile> writeFrom(
 *     List<int> buffer, [
 *     int start = 0,
 *     int end
 * ])
 * Writes from a List<int> to the file.
 * . . .
 * Returns a Future<RandomAccessFile> that completes with this RandomAccessFile
 * when the write completes.
 *
 * @description Checks that method writeFrom writes from a List<int> to the file
 * and returns Future<RandomAccessFile> that completes with this
 * RandomAccessFile when the write completes.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

void check(List<int> list) {
  int len = list.length;
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.write);
  raFile.then((RandomAccessFile rf) {
    Expect.equals(0, file.lengthSync());
    var f = rf.writeFrom(list);
    Expect.isTrue(f is Future<RandomAccessFile>);
    f.then((RandomAccessFile file) {
      Expect.isTrue(file is RandomAccessFile);
      Expect.equals(rf, file);
      Expect.equals(len, file.lengthSync());
      rf.setPositionSync(0);
      List<int> l = file.readSync(len);
      for (int i = 0; i < len; i++) {
        Expect.isTrue(i == l[i]);
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
  check([]);
  for (int i = 0; i < 10; i++) {
    list[i] = i;
    check(list.sublist(0, i + 1));
  }
}
