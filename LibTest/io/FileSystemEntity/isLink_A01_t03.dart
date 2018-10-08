/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isLink(String path)
 * Checks if type(path, followLinks: false) returns FileSystemEntityType.link.
 * @description Checks that this property returns true if
 * type(path, followLinks: false) returns FileSystemEntityType.link. Test Link
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Link link = getTempLinkSync();
  asyncStart();
  FileSystemEntity.isLink(link.path).then((result) {
    Expect.isTrue(result);
    FileSystemEntity.type(link.path, followLinks: false).then((t) {
      Expect.equals(t, FileSystemEntityType.link);
      asyncEnd();
    }).whenComplete(() {
      deleteLinkWithTarget(link);
    });
  });
}
