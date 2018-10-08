/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Link> rename(String newPath)
 * Renames this link. Returns a Future<Link> that completes with a Link instance
 * for the renamed link.
 *
 * If newPath identifies an existing link, that link is replaced. If newPath
 * identifies an existing file or directory, the operation fails and the future
 * completes with an exception.
 * @description Checks that If newPath identifies an existing file, the
 * operation fails and the future completes with an exception.
 * @author sgrekhov@unipro.ru
 * @issue 30697
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Link link = getTempLinkSync();
  File file = getTempFileSync();

  asyncStart();
  link.rename(file.path).then((renamed) {
    renamed.delete();
    Expect.fail("FileSystemException expected");
  }, onError: (e) {
    Expect.isTrue(e is FileSystemException);
    asyncEnd();
  }).whenComplete(() {
    if (link.existsSync()) {
      link.delete();
    }
    file.delete();
  });
}
