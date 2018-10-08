/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<FileStat> stat()
 * Calls the operating system's stat() function on the path of this
 * FileSystemEntity. Identical to FileStat.stat(this.path).
 *
 * Returns a Future<FileStat> object containing the data returned by stat().
 *
 * If the call fails, completes the future with a FileStat object with .type set
 * to FileSystemEntityType.notFound and the other fields invalid.
 * @description Checks that if the call fails, completes the future with a
 * FileStat object with .type set to FileSystemEntityType.notFound
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory dir = new Directory(getTempDirectoryName());
  asyncStart();
  dir.stat().then((FileStat fs) {
    Expect.equals(FileSystemEntityType.notFound, fs.type);
    asyncEnd();
  });
}
