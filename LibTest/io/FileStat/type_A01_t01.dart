/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion FileSystemEntityType type
 * final
 * The type of the object (file, directory, or link). If the call to stat()
 * fails, the type of the returned object is NOT_FOUND.
 * @description Checks that this property returns the type of the object
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
  Directory dir = getTempDirectorySync(parent: sandbox);
  FileStat fs = FileStat.statSync(file.path);
  Expect.equals(FileSystemEntityType.file, fs.type);

  fs = FileStat.statSync(dir.path);
  Expect.equals(FileSystemEntityType.directory, fs.type);

  fs = FileStat.statSync(getTempFileName());
  Expect.equals(FileSystemEntityType.notFound, fs.type);
}
