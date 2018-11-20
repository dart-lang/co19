/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isDirectorySync(String path)
 * Synchronously checks if typeSync(path) returns
 * FileSystemEntityType.directory.
 *
 * @description Checks that this property Synchronously checks if typeSync(path)
 * returns FileSystemEntityType.directory. Test Directory
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
  Expect.isFalse(FileSystemEntity.isDirectorySync(link.path));
  Expect.equals(FileSystemEntityType.link,
      FileSystemEntity.typeSync(link.path));
}
