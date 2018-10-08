/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isFileSync(String path)
 * Synchronously checks if typeSync(path) returns FileSystemEntityType.file.
 *
 * @description Checks that this property Synchronously checks if typeSync(path)
 * returns FileSystemEntityType.file. Test Directory
 * @issue 30410
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Link link = getTempLinkSync();
  try {
    Expect.isFalse(FileSystemEntity.isFileSync(link.path));
    Expect.equals(
        FileSystemEntity.typeSync(link.path), FileSystemEntityType.link);
  } finally {
    link.delete();
  }
}
