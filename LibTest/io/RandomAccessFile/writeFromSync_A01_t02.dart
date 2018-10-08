/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeFromSync(List<int> buffer, [int start = 0, int end])
 * Synchronously writes from a List<int> to the file. It will read the buffer
 * from index start to index end. If start is omitted, it'll start from index 0.
 * If end is omitted, it will write to the end of buffer.
 *
 * @description Checks that method writeFromSync synchronously writes from a
 * List<int> to file from index start to index end and if start is omitted, it
 * starts from index 0.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

void check(int len) {
  List<int> list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.write);
  raFile.then((RandomAccessFile rf) {
    Expect.equals(0, file.lengthSync());
    rf.writeFromSync(list.sublist(0, len));
    Expect.equals(len, file.lengthSync());
    rf.setPositionSync(0);
    List<int> l = rf.readSync(len);
    for (int i = 0; i < len; i++) {
      Expect.isTrue(i == l[i]);
    }
    asyncEnd();
    rf.closeSync();
  }).whenComplete(() {
    file.deleteSync();
  });
}

main() {
  for (int i = 0; i < 11; i++) {
    check(i);
  }
}
