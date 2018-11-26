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
 * @description Checks that this method identical to FileStat.stat(this.path)
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
  asyncStart();
  await file.stat().then((FileStat fs) async {
    return await FileStat.stat(file.path).then((FileStat fs2) {
      Expect.equals(fs2.type, fs.type);
      Expect.equals(fs2.mode, fs.mode);
      Expect.equals(fs2.changed, fs.changed);
      Expect.equals(fs2.modified, fs.modified);
      Expect.equals(fs2.size, fs.size);
      Expect.equals(fs2.accessed, fs.accessed);
    });
  }).whenComplete(() {
    asyncEnd();
  });
}
