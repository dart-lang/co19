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
import "../../../Utils/async_utils.dart";
import "../../../Utils/file_utils.dart";

test(Directory srcDir, Directory targetDir) async {
  srcDir.rename(targetDir.path).then((renamed) {
    renamed.exists().then((res) {
      try {
        Expect.isTrue(res);
        Expect.equals(0, renamed.listSync().length);
      } catch (e) {
        srcDir.delete();
        targetDir.delete(recursive: true);
        throw e;
      }
      Directory oldDir = new Directory(srcDir.path);
      oldDir.exists().then((res) {
        try {
          Expect.isFalse(res);
        } finally {
          targetDir.delete(recursive: true);
          asyncEnd();
        }
      });
    });
  });
}

main() {
  Directory srcDir = getTempDirectorySync();
  Directory targetDir = getTempDirectorySync();
  targetDir.createTempSync();

  asyncStart();
  test(srcDir, targetDir);
}
