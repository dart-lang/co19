/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isDirectory(String path)
 * Checks if type(path) returns FileSystemEntityType.directory.
 *
 * @description Checks that this property returns true if type(path) returns
 * FileSystemEntityType.directory. Test Directory
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
  bool result = await FileSystemEntity.isDirectory(dir.path);
  Expect.isTrue(result);
  FileSystemEntityType t = await FileSystemEntity.type(dir.path);
  Expect.equals(FileSystemEntityType.directory, t);
  asyncEnd();
}
