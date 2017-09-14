/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isLinkSync(String path)
 * Synchronously checks if typeSync(path, followLinks: false) returns
 * FileSystemEntityType.LINK.
 *
 * @description Checks that this property Synchronously checks if
 * typeSync(path, followLinks: false) returns FileSystemEntityType.LINK.
 * Test Directory
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory dir = getTempDirectorySync();
  try {
    Expect.isFalse(FileSystemEntity.isLinkSync(dir.path));
    Expect.equals(
        FileSystemEntity.typeSync(dir.path, followLinks: false),
        FileSystemEntityType.DIRECTORY);
  } finally {
    dir.delete();
  }
}
