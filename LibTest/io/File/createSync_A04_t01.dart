/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void createSync({bool recursive: false})
 * Synchronously create the file. Existing files are left untouched by
 * createSync. Calling createSync on an existing file might fail if there are
 * restrictive permissions on the file.
 *
 * If recursive is false, the default, the file is created only if all
 * directories in the path exist. If recursive is true, all non-existing path
 * components are created.
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
  Directory dir = getTempDirectorySync(parent: sandbox);
  File file = new File(dir.path);
  Expect.throws(() {
    file.createSync();
  }, (e) => e is FileSystemException);
}
