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
 * FileSystemEntityType.directory. Test Link
 * @issue 30410
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Link link = getTempLinkSync(parent: sandbox);
  asyncStart();
  bool result = await FileSystemEntity.isDirectory(link.path);
  Expect.isFalse(result);
  FileSystemEntityType t = await FileSystemEntity.type(link.path);
  Expect.equals(FileSystemEntityType.link, t);
  asyncEnd();
}
