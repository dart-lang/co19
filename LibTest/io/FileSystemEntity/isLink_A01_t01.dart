/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isLink(String path)
 * Checks if type(path, followLinks: false) returns FileSystemEntityType.LINK.
 * @description Checks that this property returns true if
 * type(path, followLinks: false) returns FileSystemEntityType.LINK. Test File
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "../file_utils.dart";

main() {
  File file = getTempFileSync();
  asyncStart();
  FileSystemEntity.isLink(file.path).then((result) {
    Expect.isFalse(result);
    FileSystemEntity.type(file.path, followLinks: false).then((t) {
      Expect.equals(t, FileSystemEntityType.FILE);
      asyncEnd();
    }).whenComplete(() {
      file.delete();
    });
  });
}
