/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<DateTime> lastAccessed()
 * Get the last-accessed time of the file.
 *
 * Returns the date and time when the file was last accessed, if the information
 * is available.
 *
 * Throws a FileSystemException if the operation fails.
 * @description Checks that this method returns the last-accessed time of the
 * file.
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
  await file.lastAccessed().then((DateTime date) {
    Expect.isNotNull(date);
    Expect.isTrue(date.difference(new DateTime.now()).inSeconds <= 1);
    asyncEnd();
  });
}
