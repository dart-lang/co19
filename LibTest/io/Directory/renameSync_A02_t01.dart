/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Directory renameSync(String newPath)
 * Synchronously renames this directory. Returns a Directory instance for the
 * renamed directory.
 *
 * If newPath identifies an existing directory, that directory is replaced. If
 * newPath identifies an existing file the operation fails and an exception is
 * thrown.
 * @description Checks that if newPath identifies an existing directory, that
 * directory is replaced
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory srcDir = getTempDirectorySync(parent: sandbox);
  Directory targetDir = getTempDirectorySync(parent: sandbox);

  srcDir.renameSync(targetDir.path);
  Expect.isTrue(targetDir.existsSync());
  Expect.isFalse(srcDir.existsSync());
  Expect.equals(0, targetDir.listSync().length);
}
