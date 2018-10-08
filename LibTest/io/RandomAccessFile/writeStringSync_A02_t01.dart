/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeStringSync(String string, {Encoding encoding: utf8})
 * . . .
 * Throws a FileSystemException if the operation fails.
 *
 * @description Checks that method writeStringSync throws a FileSystemException
 * if the operation fails.
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
    rf.writeStringSync(s);
    rf.closeSync();
    try {
      rf.writeStringSync(s);
      Expect.fail("should not be here.");
    } on Exception catch (e) {
      Expect.isTrue(e is FileSystemException);
    }
    asyncEnd();
  }).whenComplete(() {
    file.deleteSync();
  });
}

main() {
  check("");
  check("abc");
  check("алфавит");
}
