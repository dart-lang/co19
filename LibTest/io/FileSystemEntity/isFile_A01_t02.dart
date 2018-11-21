/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isFile(String path)
 * Checks if type(path) returns FileSystemEntityType.file.
 * @description Checks that this property returns true if type(path) returns
 * FileSystemEntityType.file. Test Directory
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
  asyncStart();
  bool result = await FileSystemEntity.isFile(dir.path);
  Expect.isFalse(result);
  FileSystemEntityType t = await FileSystemEntity.type(dir.path);
  Expect.equals(FileSystemEntityType.directory, t);
  asyncEnd();
}
