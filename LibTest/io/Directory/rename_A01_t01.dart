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
 * @description Checks that this method returns a Future<Directory> that
 * completes with a Directory instance for the renamed directory.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "directory_utils.dart";

test(Directory dir) async {
  String oldName = dir.path;
  String newName = getTempDirectoryName();
  dir.rename("TestDir" + Platform.pathSeparator + newName).then((renamed) {
    try {
      Expect.isTrue(renamed.path.endsWith(newName));
    } catch (e) {
      dir.delete();
      throw e;
    }
    renamed.exists().then((res) {
      try {
        Expect.isTrue(res);
      } catch (e) {
        dir.delete();
        throw e;
      }
      Directory oldDir = new Directory(oldName);
      oldDir.exists().then((res) {
        try {
          Expect.isFalse(res);
        } finally {
          renamed.delete();
          asyncEnd();
        }
      });
    });
  });
}

main() {
  Directory parent = new Directory("TestDir");
  Directory dir = parent.createTempSync();

  asyncStart();
  test(dir);
}
