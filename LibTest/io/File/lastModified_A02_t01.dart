/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<DateTime> lastModified()
 * Get the last-modified time of the file.
 *
 * Returns the date and time when the file was last modified, if the information
 * is available.
 *
 * Throws a FileSystemException if the operation fails.
 * @description Checks that FileSystemException is thrown if the operation fails
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File file = new File(getTempFilePath(parent: sandbox));
  asyncStart();
  await file.lastModified().then((DateTime date) {
    Expect.fail("Exception expected");
  }, onError: (e) {
    Expect.isTrue(e is FileSystemException);
    asyncEnd();
  });
}
