// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<int> readByte()
/// Reads a byte from the file. Returns a Future<int> that completes with the
/// byte, or with -1 if end-of-file has been reached.
///
/// @description Checks that method readByte returns Future<int> that completes
/// with -1 if end-of-file has been reached.
/// @author ngl@unipro.ru

import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main(m) {
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.write);
  raFile.then((RandomAccessFile rf) {
    Expect.isNotNull(rf);
    for (int i = 0; i < 10; i++) {
      rf.writeByteSync((i + 1) & 0xff);
    }
    var byte = rf.readByte();
    Expect.isTrue(byte is Future<int>);
    Expect.runtimeIsType<Future<int>>(byte);
    byte.then((int b) {
      Expect.equals(-1, b);
      asyncEnd();
    }).whenComplete(() {
      rf.closeSync();
      try {
        file.deleteSync();
      } catch (_) {}
    });
  });
}
