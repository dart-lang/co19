/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<FileStat> stat(String path)
 * Asynchronously calls the operating system's stat() function on path. Returns
 * a Future which completes with a FileStat object containing the data returned
 * by stat(). If the call fails, completes the future with a FileStat object
 * with .type set to FileSystemEntityType.notFound and the other fields invalid.
 * @description Checks that if the call fails, completes the future with a
 * FileStat object with .type set to FileSystemEntityType.notFound and the
 * other fields invalid.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  File file = new File(getTempFilePath());
  asyncStart();
  FileStat.stat(file.path).then((FileStat fs) {
    Expect.equals(FileSystemEntityType.notFound, fs.type);
    Expect.equals(-1, fs.size);
    Expect.equals(0, fs.mode);
    Expect.isNull(fs.accessed);
    Expect.isNull(fs.changed);
    Expect.isNull(fs.modified);
    asyncEnd();
  }, onError: (FileStat fs) {
    Expect.fail("Unexpected failure");
  });
}
