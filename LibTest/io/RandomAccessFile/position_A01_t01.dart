/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<int> position()
 * Gets the current byte position in the file. Returns a Future<int> that
 * completes with the position.
 *
 * @description Checks that method position returns Future<int> that completes
 * with the current byte position in the file.
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
    for (int i = 0; i < 10; i++) {
      rf.writeByteSync((i + 1) & 0xff);
    }
    var rfPos = rf.position();
    Expect.isTrue(rfPos is Future<int>);
    rfPos.then((int pos) {
      Expect.isTrue(pos is int);
      Expect.isTrue(pos == 10);
    }).whenComplete(() {
      rf.setPositionSync(5);
      rfPos = rf.position();
      Expect.isTrue(rfPos is Future<int>);
      rfPos.then((int pos) {
        Expect.isTrue(pos is int);
        Expect.isTrue(pos == 5);
        asyncEnd();
      }).whenComplete(() {
        rf.closeSync();
        file.deleteSync();
      });
    });
  });
}
