/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future setLastAccessed(DateTime time)
 * Modifies the time the file was last accessed.
 *
 * Throws a FileSystemException if the time cannot be set.
 * @description Checks that a FileSystemException is thrown if the time cannot
 * be set
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
  DateTime oldDate = file.lastAccessedSync();
  DateTime newDate = oldDate.add(new Duration(days: -1));

  file.deleteSync();

  asyncStart();
  await file.setLastAccessed(newDate).then((_) {
    Expect.fail("FileSystemException expected");
  }, onError: (e) {
    Expect.isTrue(e is FileSystemException);
    asyncEnd();
  });
}
