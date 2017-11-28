/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeStringSync(String string, {Encoding encoding: UTF8})
 * Synchronously writes a single string to the file using the given Encoding.
 *
 * @description Checks that method writeStringSync synchronously writes a single
 * string to the file using the given default Encoding UTF8.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../file_utils.dart";

check(String s) {
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.WRITE);
  raFile.then((RandomAccessFile rf) {
    rf.writeStringSync(s);

    var flen = rf.lengthSync();
    rf.setPositionSync(0);
    List<int> l = rf.readSync(flen);
    var ed = new Utf8Codec();
    String s1 = ed.decode(l);
    Expect.equals(s, s1);

    rf.closeSync();
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
