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
 * @description Checks that this method calls the operating system's stat()
 * function on path. Returns a Future which completes with a FileStat object
 * containing the data returned by stat(). Test not empty file
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File file = getTempFileSync(parent: sandbox);
  file.writeAsBytesSync([3, 1, 4, 1, 5, 9, 2, 6]);
  asyncStart();
  await FileStat.stat(file.path).then((FileStat fs) {
    Expect.equals(FileSystemEntityType.file, fs.type);
    Expect.equals(8, fs.size);
    Expect.equals(file.statSync().mode, fs.mode);
    Expect.equals(file.statSync().accessed, fs.accessed);
    Expect.equals(file.statSync().changed, fs.changed);
    Expect.equals(file.statSync().modified, fs.modified);
    asyncEnd();
  });
}
