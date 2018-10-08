/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RandomAccessFile> flush()
 * Flushes the contents of the file to disk. Returns a Future<RandomAccessFile>
 * that completes with this RandomAccessFile when the flush operation completes.
 *
 * @description Checks that method flush returns Future<RandomAccessFile> that
 * completes with this RandomAccessFile.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.write);
  raFile.then((RandomAccessFile rf) {
    Expect.isNotNull(rf);
    rf.writeByteSync(9);
    var rfFlush = rf.flush();
    Expect.isTrue(rfFlush is Future<RandomAccessFile>);
    var list;

    rfFlush.then((RandomAccessFile f) {
      Expect.isTrue(f is RandomAccessFile);
      Expect.isTrue(f == rf);
      f.setPositionSync(0);
      list = f.readSync(1);
      Expect.equals(9, list[0]);
      asyncEnd();
    }).whenComplete(() {
      rf.closeSync();
      file.deleteSync();
    });
  });
}
