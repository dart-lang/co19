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
 * Writes a string to the file using the given Encoding.
 *
 * @description Checks that method writeString writes a string to the file using
 * the given Encoding latin1.
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
    var f = rf.writeString(s, encoding: latin1);
    f.then((RandomAccessFile file) {
      var flen = file.lengthSync();
      rf.setPositionSync(0);
      List<int> l = file.readSync(flen);
      var ed = new Latin1Codec();
      String s1 = ed.decode(l);
      Expect.equals(s, s1);
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
  check('abcdefjhigklmnopqrstuvwxyz1234567890');
}
