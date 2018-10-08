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
 * @issue 30410
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Link link = getTempLinkSync();
  asyncStart();
  FileSystemEntity.isFile(link.path).then((result) {
    Expect.isFalse(result);
    FileSystemEntity.type(link.path).then((t) {
      Expect.equals(t, FileSystemEntityType.link);
      asyncEnd();
    }).whenComplete(() {
      deleteLinkWithTarget(link);
    });
  });
}
