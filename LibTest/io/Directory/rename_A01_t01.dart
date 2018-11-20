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
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  String oldName = dir.path;
  String newName = getTempDirectoryPath(parent: sandbox);

  asyncStart();
  await dir.rename(newName).then((renamed) {
    Expect.equals(newName, renamed.path);
    Expect.isTrue(renamed.existsSync());
    File oldFile = new File(oldName);
    Expect.isFalse(oldFile.existsSync());
    asyncEnd();
  });
}
