/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Directory> rename(String newPath)
 * Renames this directory. Returns a Future<Directory> that completes with a
 * Directory instance for the renamed directory.
 *
 * If newPath identifies an existing directory, that directory is replaced. If
 * newPath identifies an existing file, the operation fails and the future
 * completes with an exception.
 * @description Checks that if newPath identifies an existing directory, that
 * directory is replaced
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory srcDir = getTempDirectorySync();
  Directory targetDir = getTempDirectorySync();
  targetDir.createTempSync();

  asyncStart();
  srcDir.rename(targetDir.path).then((renamed) {
    try {
      Expect.equals(targetDir.path, renamed.path);
      Expect.isTrue(renamed.existsSync());
      Expect.isFalse(srcDir.existsSync());
      asyncEnd();
    } finally {
      renamed.delete();
    }
  }).whenComplete(() {
    if (srcDir.existsSync()) {
      srcDir.delete(recursive: true);
    }
    if (targetDir.existsSync()) {
      targetDir.delete(recursive: true);
    }
  });
}
