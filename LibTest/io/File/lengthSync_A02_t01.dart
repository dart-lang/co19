/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int lengthSync()
 * Synchronously get the length of the file.
 *
 * Throws a FileSystemException if the operation fails.
 * @description Checks that this method throws a FileSystemException if the
 * operation fails.
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
  Expect.throws(() {
    file.lengthSync();
  }, (e) => e is FileSystemException);
}
