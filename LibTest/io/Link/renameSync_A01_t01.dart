/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Link renameSync(String newPath)
 * Synchronously renames this link. Returns a Link instance for the renamed
 * link.
 *
 * If newPath identifies an existing link, that link is replaced. If newPath
 * identifies an existing file or directory the operation fails and an exception
 * is thrown.
 * @description Checks that this method synchronously renames this link and
 * returns a Link instance for the renamed link.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Link link = getTempLinkSync();
  String newPath = getTempFilePath();
  Link renamed = null;
  try {
    renamed = link.renameSync(newPath);
    Expect.isTrue(renamed.existsSync());
    Expect.isFalse(link.existsSync());
  } finally {
    if (renamed != null) {
      renamed.delete();
    }
  }
}
