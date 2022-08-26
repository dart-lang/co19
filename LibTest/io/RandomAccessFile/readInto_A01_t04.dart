// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Future<int> readInto(List<int> buffer, [int start = 0, int end])
/// Reads into an existing List<int> from the file. If start is present, the
/// bytes will be filled into buffer from at index start, otherwise index 0. If
/// end is present, the end - start bytes will be read into buffer, otherwise up
/// to buffer.length. If end == start nothing happens.
///
/// @description Checks that method readInto reads into an existing List<int>
/// from the file, and if start is set and end is not set the bytes are filled
/// into buffer at index start up to buffer.length.
/// @author ngl@unipro.ru

import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

check(int start) {
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.write);
  raFile.then((RandomAccessFile rf) {
    Expect.isNotNull(rf);
    for (int i = 0; i < 20; i++) {
      rf.writeByteSync((i + 1) & 0xff);
    }
    List<int> list = new List<int>.filled(20, null);
    rf.setPositionSync(0);
    var num = rf.readInto(list, start);
    Expect.isTrue(num is Future<int>);

    num.then((int n) {
      Expect.isTrue(n is int);
      Expect.equals(list.length - start, n);
      for (int i = 0; i < n; i++) {
        Expect.equals((i + 1) & 0xff, list[start + i]);
      }
      asyncEnd();
    }).whenComplete(() {
      rf.closeSync();
      file.deleteSync();
    });
  });
}

main() {
  for (int i = 0; i <= 20; i++) {
    check(i);
  }
}
