/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeStringSync(String string, {Encoding encoding: utf8})
 * Synchronously writes a single string to the file using the given Encoding.
 *
 * @description Checks that method writeStringSync synchronously writes a single
 * string to the file using the given Encoding utf8 latin1.
 * @author ngl@unipro.ru
*/
import "dart:async";
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

check(String s) {
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.write);
  raFile.then((RandomAccessFile rf) {
    rf.writeStringSync(s, encoding: latin1);
    var flen = file.lengthSync();
    rf.setPositionSync(0);
    List<int> l = rf.readSync(flen);
    var ed = new Latin1Codec();
    String s1 = ed.decode(l);
    Expect.equals(s, s1);
    asyncEnd();
    rf.closeSync();
  }).whenComplete(() {
    file.deleteSync();
  });
}

main() {
  check("");
  check("abc");
  check('abcdefjhigklmnopqrstuvwxyz1234567890');
}
