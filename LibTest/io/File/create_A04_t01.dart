/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<File> create({bool recursive: false})
 * Create the file. Returns a Future<File> that completes with the file when it
 * has been created.
 *
 * If recursive is false, the default, the file is created only if all
 * directories in the path exist. If recursive is true, all non-existing path
 * components are created.
 *
 * Existing files are left untouched by create. Calling create on an existing
 * file might fail if there are restrictive permissions on the file.
 *
 * Completes the future with a FileSystemException if the operation fails.
 * @description Checks that future is completed with a FileSystemException if
 * the operation fails
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  File file = new File(dir.path);
  asyncStart();
  await file.create(recursive: false).then((File created) {
    Expect.fail("FileSystemException is expected");
  }, onError: (e) {
    Expect.isTrue(e is FileSystemException);
    asyncEnd();
  });
}
