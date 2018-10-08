/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<RandomAccessFile> writeString(
 *     String string, {
 *     Encoding encoding: utf8
 * })
 * . . .
 * Returns a Future<RandomAccessFile> that completes with this RandomAccessFile
 * when the write completes.
 *
 * @description Checks that method writeString returns a
 * Future<RandomAccessFile> that completes with this RandomAccessFile when the
 * write completes.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

check(String s) {
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.write);
  raFile.then((RandomAccessFile rf) {
    var f = rf.writeString(s);
    Expect.isTrue(f is Future<RandomAccessFile>);

    f.then((RandomAccessFile file) {
      Expect.isTrue(file is RandomAccessFile);
      Expect.equals(rf, file);
      asyncEnd();
    }).whenComplete(() {
      rf.closeSync();
      file.deleteSync();
    });
  });
}

main() {
  check("");
  check("abc");
  check("алфавит");
}
