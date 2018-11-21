/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> readAsBytesSync()
 * Synchronously read the entire file contents as a list of bytes.
 *
 * Throws a FileSystemException if the operation fails.
 * @description Checks that a FileSystemException is thrown if the operation
 * fails
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
  file.writeAsBytesSync([1, 2, 3, 4, 127]);
  file.deleteSync();
  Expect.throws(() {
    file.readAsBytesSync();
  }, (e) => e is FileSystemException);
}
