/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String path
 * Gets the path of the file underlying this RandomAccessFile.
 *
 * @description Checks that path property returns the path of the file
 * underlying this RandomAccessFile.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  asyncStart();
  Future<RandomAccessFile> raFile = file.open(mode: FileMode.read);
  raFile.then((RandomAccessFile rf) {
    Expect.isNotNull(rf);
    String rfPath = rf.path;
    Directory parent = Directory.systemTemp;
    String name = getPrefix();
    Expect.isTrue(rfPath.contains(parent.path + Platform.pathSeparator + name));
    asyncEnd();
    rf.closeSync();
  }).whenComplete(() {
    file.deleteSync();
  });
}
